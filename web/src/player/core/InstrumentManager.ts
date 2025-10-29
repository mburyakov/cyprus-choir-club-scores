import AudioEngine, {PresetKey} from './AudioEngine'
import {Song} from "./MIDIFile";

export default class InstrumentManager {
  private readonly audio: AudioEngine

  constructor(audio: AudioEngine) {
    this.audio = audio
  }

  async prepareForSong(song: Song): Promise<void> {
    const ac = this.audio.context
    const player = this.audio.player
    if (!ac || !player || !song) return
    const presetsToLoad = new Set<PresetKey>()
    song.tracks.forEach(track => {
      presetsToLoad.add({isDrum: false, n: track.program})
    })
    song.beats.forEach(beat => {
      presetsToLoad.add({isDrum: true, n: beat.n})
    })
    await this.audio.loadPresets(presetsToLoad)
  }

  async switchInstrument(trackIdx: number, instrumentIndex: number): Promise<void> {
    await this.audio.loadPresets(new Set([{isDrum: false, n: instrumentIndex}]))
  }
}
