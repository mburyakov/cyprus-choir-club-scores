declare module 'webaudiofont' {
  export default class WebAudioFontPlayer {
    envelopes: WaveEnvelope[];
    loader: WebAudioFontLoader;
    afterTime: number;
    nearZero: number;
    createChannel(audioContext: AudioContext);
    createReverberator(audioContext: AudioContext);
    limitVolume(volume: number | undefined): number;
    queueChord(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitches: number[], duration: number, volume?: number, slides?: WaveSlide[][]): WaveEnvelope[];
    queueStrumUp(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitches: number[], duration: number, volume?: number, slides?: WaveSlide[][]): WaveEnvelope[];
    queueStrumDown(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitches: number[], duration: number, volume?: number, slides?: WaveSlide[][]): WaveEnvelope[];
    queueStrum(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitches: number[], duration: number, volume?: number, slides?: WaveSlide[][]): WaveEnvelope[];
    queueSnap(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitches: number[], duration: number, volume?: number, slides?: WaveSlide[][]): WaveEnvelope[];
    resumeContext(audioContext: AudioContext): void;
    queueWaveTable(audioContext: AudioContext, target: AudioNode, preset: WavePreset, when: number, pitch: number, duration: number, volume?: number, slides?: WaveSlide[]): WaveEnvelope | null;
    noZeroVolume(n: number): number;
    setupEnvelope(audioContext: AudioContext, envelope: WaveEnvelope, zone: WaveZone, volume: number, when: number, sampleDuration: number, noteDuration: number): void;
    numValue(aValue: any, defValue: number): number;
    findEnvelope(audioContext: AudioContext, target: AudioNode, when: number, duration: number): WaveEnvelope;
    adjustPreset(audioContext: AudioContext, preset: WavePreset): void;
    adjustZone(audioContext: AudioContext, zone: WaveZone): void;
    findZone(audioContext: AudioContext, preset: WavePreset, pitch: number): WaveZone | null;
    cancelQueue(audioContext: AudioContext): void;
  }

  export class WebAudioFontLoader {
    cached: CachedPreset[];
    player: WebAudioFontPlayer;
    instrumentKeyArray: string[];
    instrumentNamesArray: string[];
    choosenInfos: NumPair[];
    drumNamesArray: string[];
    drumKeyArray: string[];
    constructor(player: WebAudioFontPlayer) {
      this.player = player;
    }
    startLoad(audioContext: AudioContext, filePath: string, variableName: string): void;
    decodeAfterLoading(audioContext: AudioContext, variableName: string): void;
    waitOrFinish(variableName: string, onFinish: () => void): void;
    loaded(variableName: string): boolean;
    progress(): number;
    waitLoad(onFinish: () => void): void;
    instrumentTitles(): string[];
    instrumentKeys(): string[];
    instrumentInfo(n: number): PresetInfo;
    findInstrument(program: number): number;
    drumTitles(): string[];
    drumKeys(): string[];
    drumInfo(n: number): PresetInfo;
    findDrum(nn: number): number;
  }
  export type PresetInfo = {
    variable: string,
    url: string,
    title: string,
    pitch: number
  };
  export type WavePreset = {}
}
