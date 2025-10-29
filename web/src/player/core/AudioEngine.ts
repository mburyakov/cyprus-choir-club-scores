import MIDISounds from "midi-sounds-react";
import WebAudioFontPlayer from "webaudiofont";

// Thin wrapper around MIDISounds / WebAudioFont player
export class AudioEngine {
  private readonly _ac: AudioContext
  private readonly _player: WebAudioFontPlayer
  private _eq: BiquadFilterNode | null = null
  private _convolver: ConvolverNode | null = null

  constructor(midi: MIDISounds) {
    this._ac = midi.audioContext
    this._player = midi.player
  }

  get context(): AudioContext { return this._ac }
  get player(): WebAudioFontPlayer { return this._player }

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
