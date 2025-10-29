import AudioEngine from './AudioEngine'
import InstrumentManager from "./InstrumentManager";
import {Song} from "./MIDIFile";

export type StatusListener = (status: string) => void

type Envelope = any

export default class PlayerEngine {
  readonly audio: AudioEngine
  readonly song: Song
  readonly instrumentManager: InstrumentManager
  private drumBusGain = 1.0 // 0..2 (percent/100)

  // timing
  private tempo = 1.0
  private songStart = 0 // AudioContext time (sec)
  private virtualTime = 0 // song time at pause/seek (sec)
  private lastScheduled = 0
  private isPlaying = false
  private tickTimer: number | null = null

  private readonly currentEnvelops: Map<number, Envelope>[]

  private readonly onStatus?: StatusListener

  constructor(audio: AudioEngine, song: Song, opts?: {
    onStatus?: StatusListener
  }) {
    this.audio = audio
    this.instrumentManager = new InstrumentManager(audio)
    this.song = song
    this.currentEnvelops = song.tracks.map(() => new Map<number, Envelope>())
    this.onStatus = opts?.onStatus
  }

  getProgress(): number {
    return this.virtualTime
  }

  setTempo(v: number) {
    if (!isFinite(v) || v <= 0) return
    const ac = this.audio.context
    if (ac && this.isPlaying) {
      // continuity: keep current virtual time but change mapping
      const currentVirtual = (ac.currentTime - this.songStart) * this.tempo
      this.songStart = ac.currentTime - currentVirtual / v
      this.virtualTime = currentVirtual
      this.lastScheduled = currentVirtual
    }
    this.tempo = v
  }

  setDrumBus(percent: number) {
    this.drumBusGain = Math.max(0, Math.min(2, percent / 100))
  }

  start() {
    const ac = this.audio.context
    if (!ac) {
      this.onStatus?.('Audio context not available')
      return
    }
    if (!this.song) {
      this.onStatus?.('No song loaded')
      return
    }
    this.songStart = ac.currentTime - this.virtualTime / this.tempo
    this.lastScheduled = this.virtualTime
    this.isPlaying = true
    this.onStatus?.('Starting…')
    this.startScheduler()
  }

  pause() {
    const ac = this.audio.context
    if (!ac) return
    this.isPlaying = false
    this.virtualTime = (ac.currentTime - this.songStart) * this.tempo
    this.clearScheduler()
    this.startScheduler(3000)
    this.audio.cancelQueue()
    this.onStatus?.('Paused')
  }

  stop() {
    const ac = this.audio.context
    if (!ac) return
    this.isPlaying = false
    this.clearScheduler()
    this.audio.cancelQueue()
    this.virtualTime = 0
    this.lastScheduled = 0
    this.onStatus?.('Stopped')
  }

  playing(): boolean {
    return this.isPlaying
  }

  seekTo(t: number) {
    const ac = this.audio.context
    if (!ac || !this.song) return
    const total = this.song?.duration ?? 0
    const clamped = Math.max(0, Math.min(t, total))
    const wasPlaying = this.isPlaying
    if (wasPlaying) this.pause()
    else this.audio.cancelQueue()
    this.virtualTime = clamped
    this.lastScheduled = clamped
    this.songStart = ac.currentTime - clamped / this.tempo
    this.onStatus?.(`Position: ${clamped.toFixed(2)} s`)
    if (wasPlaying) this.start()
  }

  private startScheduler(timeout: number = 176) {
    this.tick()
    this.clearScheduler()
    this.tickTimer = window.setInterval(() => this.tick(), timeout)
  }

  private clearScheduler() {
    if (this.tickTimer != null) {
      window.clearInterval(this.tickTimer)
      this.tickTimer = null
    }
  }

  private tick() {
    const ac = this.audio.context
    const player = this.audio.player
    const s = this.song
    if (!ac || !player || !s ) return

    const now = ac.currentTime
    if (this.isPlaying) {
      this.virtualTime = Math.max(0, now - this.songStart) * this.tempo
    }
    if (!this.isPlaying) {
      this.songStart = now - this.virtualTime / this.tempo
    }

    const total = s.duration
    if (this.virtualTime >= total) {
      this.isPlaying = false
      this.clearScheduler()
      this.onStatus?.('Completed — ready')
      this.virtualTime = 0
      this.lastScheduled = 0
      return
    }

    if (this.isPlaying) {
      const LOOKAHEAD = 0.25
      const windowStart = this.lastScheduled
      const windowEnd = Math.min(total, this.virtualTime + LOOKAHEAD)
      if (windowEnd > windowStart) {
        this.scheduleNotes(windowStart, windowEnd, this.songStart, this.tempo)
        this.lastScheduled = windowEnd
      }
    } else {
      const LOOKAHEAD = 0.0025
      const windowStart = Math.max(0, this.virtualTime - LOOKAHEAD)
      const windowEnd = Math.min(total, this.virtualTime + LOOKAHEAD)
      if (windowEnd > windowStart) {
        this.scheduleNotes(windowStart, windowEnd, now - this.virtualTime * 100 / this.tempo, this.tempo / 100)
        this.lastScheduled = windowEnd
      }
    }

    this.onStatus?.(`Playing… ${this.virtualTime.toFixed(2)} s`)
  }

  private scheduleNotes(fromTime: number, toTime: number, songStart: number, tempo: number): void {
    const ac = this.audio.context!
    const s = this.song
    const start = fromTime
    const end = toTime
    // Tracks
    for (let t = 0; t < s.tracks.length; t++) {
      const track = s.tracks[t]
      const wavePreset = this.audio.getWavePreset({isDrum: false, n: track.program})
      const volume = track.volume / 7
      if (!track.notes || !wavePreset) continue
      const now = ac.currentTime
      track.notes.forEach((n, i) => {
        if (n.when < end && n.when + n.duration >= start) {
          const whenAbs = songStart + n.when / tempo
          let dur = n.duration / tempo;
          const whenAbsAdjusted = Math.max(whenAbs, now)
          let durAdjusted = dur + Math.min(0, whenAbs - now)
          if (durAdjusted > 0) {
            let existingEnvelope = this.currentEnvelops[t].get(i);
            const envelope = this.queueWithVariativeDuration(ac, ac.destination, wavePreset, whenAbsAdjusted, n.pitch, durAdjusted, volume)
            this.currentEnvelops[t].set(i, envelope)
          }
        }
      })
    }

    // Beats
    for (let b = 0; b < (s.beats?.length || 0); b++) {
      const beat = s.beats[b]
      const wavePreset = this.audio.getWavePreset({isDrum: true, n: beat.n})
      const volume = ((beat.volume) / 2) * this.drumBusGain
      if (!beat.notes || !wavePreset) continue
      for (let i = 0; i < beat.notes.length; i++) {
        const bn = beat.notes[i]
        if (bn.when >= start && bn.when < end) {
          const whenAbs = songStart + bn.when / tempo
          const dur = 1.5
          this.audio.player.queueWaveTable(ac, ac.destination, wavePreset, whenAbs, beat.n, dur, volume)
        }
      }
    }
  }

  private queueWithVariativeDuration(ac: AudioContext, dest: AudioNode, wavePreset: any, when: number, pitch: number, duration: number, volume: number) {
    const envelope = this.audio.player.queueWaveTable(ac, dest, wavePreset, when, pitch, 60, volume, [])
    envelope.audioBufferSourceNode.stop(when + 0.1);
    envelope.audioBufferSourceNode.stop(when + duration);
    return envelope
  }
}
