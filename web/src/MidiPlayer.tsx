import React, { useMemo } from 'react'

function useHashQuery() {
  // HashRouter keeps query string after the route in the hash, so parse that
  return useMemo(() => new URLSearchParams(window.location.hash.split('?')[1] || ''), [window.location.hash])
}

export default function MidiPlayer() {
  const query = useHashQuery()
  const midiFile = query.get('midiFile') || ''
  const room = query.get('room') || 'default'
  const src = `/static/midiplayer/midiplayer.html?midiFile=${encodeURIComponent(midiFile)}&room=${encodeURIComponent(room)}`
  return (
    <div style={{ padding: 16 }}>
      <p><a href="#/">Up to index</a></p>
      <h1>MIDI Player</h1>
      <iframe title="midiplayer" src={src} style={{width: '100%', height: '80vh', border: '1px solid #ccc'}} />
    </div>
  )
}
