import React, {useCallback, useEffect, useMemo, useRef, useState} from 'react'
import MIDISounds from 'midi-sounds-react'
import MidiSvgView from './MidiSvgView'
import AudioEngine from './core/AudioEngine'
import PlayerEngine from './core/Scheduler'
import WebAudioFontPlayer from "webaudiofont";
import {MIDIFile, Song, Track} from "./core/MIDIFile";
import TapTempo, {TapInfo} from "./core/TapTempo";

class PlayerPageOptions {
  constructor(
    public midiFile: string = '',
    public room: string = ''
  ) {}
}

function parseHashQuery(): PlayerPageOptions {
  return useMemo(() => {
    const query = new URLSearchParams(window.location.hash.split('?')[1] || '')
    const midiFile = query.get('midiFile') || ''
    const room = query.get('room') || 'default'
    return new PlayerPageOptions(midiFile, room)
  }, [window.location.hash])
}

function TempoControl({ playerEngine }: { playerEngine: PlayerEngine | null }) {
  const [tempoCoeff, setTempoCoeff] = useState<number>(1.0)
  const onTempoChange: (e: React.ChangeEvent<HTMLInputElement>) => void = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const v = Number(e.target.value) / 100
    setTempoCoeff(v)
  }, [])
  useEffect(() => {
    playerEngine?.setTempo(tempoCoeff)
  }, [tempoCoeff])
  return <label>
    Tempo: <input type="range" min={50} max={150} value={Math.round(tempoCoeff * 100)} onChange={onTempoChange} />
    <span> {Math.round(tempoCoeff * 100)}%</span>
  </label>
}

function PlayerComponent({ playerEngine } : { playerEngine: PlayerEngine }) {

  function instrumentOptions(player: WebAudioFontPlayer): { index: number; title: string }[] {
    return player.loader.instrumentTitles().map((title, index) => {
      return { index: index, title: title }
    });
  }

  const onTrackInstrChange = useCallback(async (idx: number, instrIndex: number) => {
    await playerEngine.instrumentManager.switchInstrument(idx, instrIndex)
  }, [playerEngine])

  const seekTo = useCallback((t: number) => {
    playerEngine?.seekTo(t)
  }, [playerEngine])

  const [showViz, setShowViz] = useState(true)
  const [pxPerSec, setPxPerSec] = useState(100)
  const [drumBusGain, setDrumBusGain] = useState<number>(100) // percent

  useEffect(() => {
    playerEngine.setDrumBus(drumBusGain)
  }, [drumBusGain])

  return playerEngine?.song && (
    <div style={{ marginTop: 16 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 8 }}>
        <h2 style={{ margin: 0 }}>Visualization</h2>
        <label style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
          <input type="checkbox" checked={showViz} onChange={e => setShowViz(e.target.checked)} /> Show
        </label>
        <label style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
          Zoom
          <button onClick={() => { setPxPerSec(v => Math.max(20, Math.round(v * 0.8))) }} disabled={!showViz}>−</button>
          <span>{pxPerSec}px/s</span>
          <button onClick={() => { setPxPerSec(v => Math.min(800, Math.round(v * 1.25))) }} disabled={!showViz}>+</button>
        </label>
      </div>
      {showViz && (
        <div style={{ width: '100%' }}>
          <MidiSvgView
            song={playerEngine.song}
            songState={{currentTime: playerEngine.getProgress(), isPlaying: playerEngine.playing()}}
            pxPerSec={pxPerSec}
            follow={true}
            onSeek={seekTo}
          />
        </div>
      )}

      <h2 style={{ marginTop: 16 }}>Mixer</h2>
      <div style={{ margin: '8px 0' }}>
        <label>
          Drum bus: <input type="range" min={0} max={200} value={drumBusGain} onChange={e => setDrumBusGain(Number(e.target.value))} />
          <span> {drumBusGain}%</span>
        </label>
      </div>
      <div>
        {playerEngine?.song?.tracks?.map((tr: Track, idx: number) => (
          <div key={idx} style={{ display: 'flex', gap: 8, alignItems: 'center', margin: '6px 0', flexWrap: 'wrap' }}>
            <div style={{ width: 70 }}>Track {idx + 1}</div>
            <label style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
              Vol
              <input type="range" min={0} max={7} value={tr.volume ?? 7} onChange={e => console.log(`TODO: set volume ${e.target.value} for track ${idx}`)} />
              <span>{tr.volume ?? 7}</span>
            </label>
            <div style={{ minWidth: 200, fontSize: 12, color: '#555' }}>{tr.info?.title || `Program ${tr.program}`}</div>
            <label style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
              Instrument
              <select
                value={(typeof tr.id === 'number' ? tr.id : (playerEngine.audio.player.loader.findInstrument(tr.program)))}
                onChange={e => onTrackInstrChange(idx, Number(e.target.value))}
                disabled={false}>
              {instrumentOptions(playerEngine.audio.player).map(opt => (
                <option key={opt.index} value={opt.index}>{opt.index}: {opt.title}</option>
              ))}
              </select>
            </label>
          </div>
        ))}
      </div>
      <TapTempo callback={(previousTaps) => { return roundPosition(previousTaps, playerEngine) }}/>
    </div>
  )
}

function roundPosition(previousTaps: TapInfo[], playerEngine: PlayerEngine) {
  const tempo = 82 / 60
  const currentSongTime = playerEngine.getProgress()
  const currentSongTimeBeats = currentSongTime * tempo
  const roundedSongTimeBeats = Math.round(currentSongTimeBeats)
  const roundedSongTime = roundedSongTimeBeats / tempo
  // console.log(`rounded ${currentSongTime} to ${roundedSongTime} (${currentSongTimeBeats} to ${roundedSongTimeBeats} beats)`)
  // playerEngine.seekTo(roundedSongTime)

  if (previousTaps.length > 0 && previousTaps[previousTaps.length - 1].beatTime === roundedSongTimeBeats - 1) {
    const newTempo = playerEngine.getTempo() * (1 + (roundedSongTime - currentSongTime) / tempo)
    console.log(`new tempo: ${newTempo}`)
    playerEngine.setTempo(newTempo)
  }

  return roundedSongTimeBeats
}

export default function NativeMidiPlayer() {
  const query = parseHashQuery()

  const [status, setStatus] = useState<string>('Not started')
  const [info, setInfo] = useState<string>('')

  // Libraries

  // MIDI-Sounds component ref; we derive audio/player from it
  const midiSoundsRef = useRef<MIDISounds | null>(null)

  const playerEngineRef = useRef<PlayerEngine | null>(null)

  useEffect(() => {
    document.title = 'MIDI Player (Native)'
  }, [])

  const prepareInstruments = useCallback(async (parsedSong: any) => {
    if (!parsedSong) return
    try {
      await playerEngineRef.current?.instrumentManager?.prepareForSong(parsedSong as Song)
      setStatus('Instruments loaded')
    } catch (e: any) {
      setStatus(`Instrument load failed: ${e?.message || e}`)
    } finally {
    }
  }, [])

  const loadMidi = useCallback(async (): Promise<any | null> => {
    if (!query.midiFile) {
      setStatus('No MIDI file specified')
      return null
    }
    const res = await fetch(`static/${(query.midiFile)}`)
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const buf = await res.arrayBuffer()
    const mf = new MIDIFile(buf)
    const parsed = mf.parseSong()
    const audioEngine = new AudioEngine(midiSoundsRef.current!!);
    audioEngine.initFromMidiSounds()
    await audioEngine.ensureRunning()
    playerEngineRef.current = new PlayerEngine(audioEngine, parsed, {
      onStatus: (s) => setStatus(s),
    })
    setInfo(`${parsed.beats?.length || 0} beats, ${parsed.tracks?.length || 0} tracks`)
    await prepareInstruments(parsed)
    return parsed
  }, [query.midiFile, prepareInstruments])

  const onStop = useCallback(() => {
    playerEngineRef.current?.stop()
  }, [])

  const onPlayPause = useCallback(async () => {
    const engine = playerEngineRef.current!
    if (engine.playing()) {
      engine.pause()
    } else {
      engine.start()
    }
  }, [loadMidi, playerEngineRef.current?.song, prepareInstruments, playerEngineRef.current?.playing()])

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      try {
        playerEngineRef.current?.stop()
      } catch {}
      try {
        playerEngineRef.current?.audio?.cancelQueue()
      } catch {}
    }
  }, [])

  const formatTime = useCallback((sec: number) => {
    if (!isFinite(sec) || sec < 0) sec = 0
    const m = Math.floor(sec / 60)
    const s = Math.floor(sec % 60)
    return `${m}:${s.toString().padStart(2, '0')}`
  }, [])

  return (
    <div style={{ padding: 16 }}>
      <h1>MIDI Player (Native React)</h1>
      <p>
        This is an experimental native React version of the MIDI player. The legacy player remains available as a fallback.
      </p>

      <div style={{ marginBottom: 12 }}>
        <div><b>MIDI file:</b> {query.midiFile || '(none provided)'}</div>
        <div><b>Room:</b> {query.room}</div>
        <div><b>Status:</b> {status}</div>
        {info && <div><b>Info:</b> {info}</div>}
        <div style={{ fontSize: 12, color: '#666' }}>
          Progress: {formatTime(playerEngineRef.current?.getProgress()!!)} / {formatTime(playerEngineRef.current?.song.duration ?? 0)} ({playerEngineRef.current?.getProgress()?.toFixed(2)} s)
        </div>
      </div>

      <div style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 16 }}>
        <button onClick={onPlayPause} disabled={!playerEngineRef.current}>
          {playerEngineRef.current?.playing() ? 'Pause' : 'Play'}
        </button>
        <button onClick={onStop} disabled={!playerEngineRef.current}>Stop</button>
        <button onClick={loadMidi} disabled={!query.midiFile || !!playerEngineRef.current}>Load MIDI</button>
        <TempoControl playerEngine={playerEngineRef.current!!}/>
      </div>

      <div>
        <a href={`static/midiplayer/midiplayer.html?midiFile=${encodeURIComponent(query.midiFile)}&room=${encodeURIComponent(query.room)}`}>Open legacy player</a>
      </div>
      {playerEngineRef.current && (
        <PlayerComponent playerEngine={playerEngineRef.current} />
      )}
      {/*TODO: MIDISounds component should be a part of PlayerComponent*/}
      <MIDISounds ref={midiSoundsRef} appElementName="root" />
    </div>
  )
}
