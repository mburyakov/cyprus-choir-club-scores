import AudioEngine from './AudioEngine'
import {Song} from "./MIDIFile";

export default class InstrumentManager {
  private audio: AudioEngine

  constructor(audio: AudioEngine) {
    this.audio = audio
  }

  async prepareForSong(song: Song): Promise<void> {
    const ac = this.audio.context
    const player = this.audio.player
    if (!ac || !player || !song) return
    try {
      // Tracks
      for (let i = 0; i < (song.tracks?.length || 0); i++) {
        const nn = player.loader.findInstrument(song.tracks[i].program)
        const info = player.loader.instrumentInfo(nn)
        song.tracks[i].info = info
        song.tracks[i].id = nn
        player.loader.startLoad(ac, info.url, info.variable)
      }
      // Beats
      for (let i = 0; i < (song.beats?.length || 0); i++) {
        const nn = player.loader.findDrum(song.beats[i].n)
        const info = player.loader.drumInfo(nn)
        song.beats[i].info = info
        song.beats[i].id = nn
        player.loader.startLoad(ac, info.url, info.variable)
      }
      await new Promise<void>(resolve => player.loader.waitLoad(() => resolve()))
    } finally {
    }
  }

  async switchInstrument(song: Song, trackIdx: number, instrumentIndex: number): Promise<void> {
    const ac = this.audio.context
    const player = this.audio.player
    const info = player.loader.instrumentInfo(instrumentIndex)
    player.loader.startLoad(ac, info.url, info.variable)
    await new Promise<void>(resolve => player.loader.waitLoad(() => resolve()))
    const track = song.tracks[trackIdx]
    if (track) {
      track.id = instrumentIndex
      track.info = info
    }
  }
}
