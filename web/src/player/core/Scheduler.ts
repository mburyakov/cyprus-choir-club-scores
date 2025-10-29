import AudioEngine from './AudioEngine'
import InstrumentManager from "./InstrumentManager";
import {Song} from "./MIDIFile";

export type StatusListener = (status: string) => void

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

  private readonly onStatus?: StatusListener

  constructor(audio: AudioEngine, song: Song, opts?: {
    onStatus?: StatusListener
  }) {
    this.audio = audio
    this.instrumentManager = new InstrumentManager(audio)
    this.song = song
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
    this.songStart = ac.currentTime
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

  private startScheduler() {
    this.clearScheduler()
    this.tickTimer = window.setInterval(() => this.tick(), 176)
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
    if (!ac || !player || !s || !this.isPlaying) return

    const now = ac.currentTime
    const elapsed = Math.max(0, (now - this.songStart) * this.tempo)
    this.virtualTime = elapsed

    const total = s.duration ?? Number.POSITIVE_INFINITY
    if (elapsed >= total) {
      this.isPlaying = false
      this.audio.cancelQueue()
      this.clearScheduler()
      this.onStatus?.('Completed — ready')
      this.virtualTime = 0
      this.lastScheduled = 0
      return
    }

    const LOOKAHEAD = 0.25
    const windowStart = this.lastScheduled
    const windowEnd = Math.min(total, elapsed + LOOKAHEAD)
    if (windowEnd > windowStart) {
      this.scheduleNotes(windowStart, windowEnd)
      this.lastScheduled = windowEnd
    }

    this.onStatus?.(`Playing… ${elapsed.toFixed(2)} s`)
  }

  private scheduleNotes(fromTime: number, toTime: number) {
    const ac = this.audio.context!
    const s = this.song
    const start = fromTime
    const end = toTime

    // Tracks
    for (let t = 0; t < (s.tracks?.length || 0); t++) {
      const track = s.tracks[t]
      const wavePreset = this.audio.getWavePreset({isDrum: false, n: track.program})
      const volume = (track.volume ?? 7) / 7
      if (!track.notes || !wavePreset) continue
      for (let i = 0; i < track.notes.length; i++) {
        const n = track.notes[i]
        if (n.when >= start && n.when < end) {
          const whenAbs = this.songStart + n.when / this.tempo
          let dur = (n.duration ?? 0) / this.tempo
          if (dur > 3) dur = 3
          try {
            this.audio.player.queueWaveTable(ac, ac.destination, wavePreset, whenAbs, n.pitch, dur, volume, n.slides)
          } catch {}
        }
      }
    }

    // Beats
    for (let b = 0; b < (s.beats?.length || 0); b++) {
      const beat = s.beats[b]
      const wavePreset = this.audio.getWavePreset({isDrum: true, n: beat.n})
      const volume = ((beat.volume ?? 2) / 2) * this.drumBusGain
      if (!beat.notes || !wavePreset) continue
      for (let i = 0; i < beat.notes.length; i++) {
        const bn = beat.notes[i]
        if (bn.when >= start && bn.when < end) {
          const whenAbs = this.songStart + bn.when / this.tempo
          const dur = 1.5
          try {
            this.audio.player.queueWaveTable(ac, ac.destination, wavePreset, whenAbs, beat.n, dur, volume)
          } catch {}
        }
      }
    }
  }
}
