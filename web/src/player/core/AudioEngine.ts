import MIDISounds from "midi-sounds-react";
import WebAudioFontPlayer, {PresetInfo, WavePreset} from "webaudiofont";

export type PresetKey = {
  isDrum: boolean
  n: number
}

// Thin wrapper around MIDISounds / WebAudioFont player
export class AudioEngine {
  private readonly _ac: AudioContext
  private readonly _player: WebAudioFontPlayer
  private _eq: BiquadFilterNode | null = null
  private _convolver: ConvolverNode | null = null

  private drumInfoCache: { [n: number]: {id: number, info: PresetInfo} } = {}
  private instrumentInfoCache: { [n: number]: {id: number, info: PresetInfo} } = {}

  constructor(midi: MIDISounds) {
    this._ac = midi.audioContext
    this._player = midi.player
  }

  get context(): AudioContext { return this._ac }
  get player(): WebAudioFontPlayer { return this._player }

  async loadPresets(keys: Set<PresetKey>) {
    keys.forEach(key => {
      if (key.isDrum) {
        const nn = this.player.loader.findDrum(key.n)
        const info = this.player.loader.drumInfo(nn)
        this.drumInfoCache[key.n] = {id: nn, info: info}
        this.player.loader.startLoad(this.context, info.url, info.variable)
      } else {
        const info = this.player.loader.instrumentInfo(key.n)
        this.instrumentInfoCache[key.n] = {id: key.n, info: info}
        this.player.loader.startLoad(this.context, info.url, info.variable)
      }
    })
    await new Promise<void>(resolve => this.player.loader.waitLoad(() => resolve()))
  }

  getWavePreset(key: PresetKey): WavePreset | null {
    const info: PresetInfo = key.isDrum ? this.drumInfoCache[key.n].info : this.instrumentInfoCache[key.n].info
    return info ? window[info.variable as any] as WavePreset : null
  }

  initFromMidiSounds() {
    if (!this._eq) {
      const eq = this._ac.createBiquadFilter()
      eq.type = 'peaking'
      eq.frequency.value = 1000
      eq.gain.value = 0
      this._eq = eq
    }
    if (!this._convolver) {
      this._convolver = this._ac.createConvolver()
    }
    this._eq!.connect(this._convolver!)
    this._convolver!.connect(this._ac.destination)
  }

  async ensureRunning() {
    if (!this._ac) return
    if (this._ac.state === 'suspended') await this._ac.resume()
  }

  cancelQueue() {
    try { if (this._ac && this._player) this._player.cancelQueue(this._ac) } catch {}
  }
}

export default AudioEngine
