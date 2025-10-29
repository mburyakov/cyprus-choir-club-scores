import React, { useEffect, useState } from 'react'
import { Link, Route, Routes, useParams } from 'react-router-dom'
import MidiPlayer from './MidiPlayer'
import NativeMidiPlayer from './player/NativeMidiPlayer'

export type ItemFile = {
  has_pdf?: boolean
  has_midi?: boolean
  pdf_name?: string
  midi_name?: string
  mp3_name?: string
  display_name: string
}
export type Item = {
  name: string
  display_name: string
  files: ItemFile[]
  files_short: ItemFile[]
}

function useItems() {
  const [items, setItems] = useState<Item[] | null>(null)
  useEffect(() => {
    fetch('/static/items.json')
      .then(res => {
        if (!res.ok) throw new Error(`Failed to load items.json: ${res.status}`)
        return res.json()
      })
      .then((data: Item[]) => setItems(data))
  }, [])
  return items
}

function Index() {
  const items = useItems()
  if (!items) return <div>Loading…</div>
  return (
    <div>
      <h1>
        Scores of Cyprus Choir Club:
        <img src="/static/cyprus-accolada.svg" alt="Cyprus Accolada" width={100} />
      </h1>
      <ul>
        {items.map(it => (
          <li key={it.name}>
            <Link to={`/item/${it.name}`}>{it.display_name}</Link>
            <ul>
              {it.files_short.map((f, idx) => (
                ItemBody(idx, f)
              ))}
            </ul>
          </li>
        ))}
      </ul>
      <p>
        <a href="https://www.videolan.org/vlc/" target="_blank" rel="noreferrer">VLC</a> player is recommended for playing midi files.
      </p>
    </div>
  )
}

function itemPageTitle(items: Item[] | null, name: string | undefined): string {
  if (!items) return "Loading..."
  const item = items.find(i => i.name === name)
  if (!item) return "Not found"
  return item.display_name
}

function ItemBody(idx: number, f: ItemFile) {
  return <li key={idx}>
    {f.has_pdf ? (
      <a href={`/static/${f.pdf_name}`}>{f.display_name}</a>
    ) : (
      <>{f.display_name}</>
    )}
    {f.has_midi && (
      <>
        {" "}(<a href={`/static/${f.midi_name}`}>Download midi</a>)
        {f.mp3_name && (
          <>
            {" "}(<a href={`/static/${f.mp3_name}`}>Download mp3</a>)
          </>
        )}
        {" "}(<a href={`/static/midiplayer/midiplayer.html?midiFile=${encodeURIComponent(f.midi_name!)}&room=default`}>Play online</a>)
      </>
    )}
  </li>
}

function ItemView() {
  const { name } = useParams()
  const items = useItems()
  useEffect(() => {
    document.title = itemPageTitle(items, name)
  }, [items])
  if (!items) {
    return <div>Loading…</div>
  }
  const item = items.find(i => i.name === name)
  if (!item) return (
    <div>
      <p><Link to="/">Up to index</Link></p>
      <div>Not found</div>
    </div>
  )
  return (
    <div>
      <p><Link to="/">Up to index</Link></p>
      <h1>{item.display_name}</h1>
      <ul>
        {item.files.map((f, idx) => (
          ItemBody(idx, f)
        ))}
      </ul>
      <p>
        <a href="https://www.videolan.org/vlc/">VLC</a> player is recommended for playing midi files.
      </p>
    </div>
  )
}

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<Index />} />
      <Route path="/item/:name" element={<ItemView />} />
      <Route path="/midiplayer" element={<MidiPlayer />} />
      <Route path="/midiplayer2" element={<NativeMidiPlayer />} />
    </Routes>
  )
}
