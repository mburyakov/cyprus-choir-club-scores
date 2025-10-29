declare module 'midi-sounds-react' {
  import * as React from 'react'
  import WebAudioFontPlayer from "webaudiofont"

  export default class MIDISounds extends React.Component<{
    appElementName?: string
    instruments?: number[]
    drums?: number[]
    style?: React.CSSProperties
    className?: string
  }> {
    player: WebAudioFontPlayer
    audioContext: AudioContext
    contextTime(): number
    cacheInstrument(program: number): void
    cacheDrum(drum: number): void
    playChordNow(program: number, pitches: number[], duration: number): void
    playChordAt(program: number, when: number, pitches: number[], duration: number): void
    playDrumsNow(drums: number[], duration?: number): void
    playDrumsAt(drums: number[], when: number, duration?: number): void
  }

}
