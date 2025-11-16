import React, {useEffect, useMemo, useRef} from 'react'
import {Song} from "./core/MIDIFile";

type SongState = {
  currentTime: number,
  isPlaying: boolean,
}

/**
 * Minimal SVG visualization for the Native MIDI player.
 * - Renders per-track lanes and note rectangles.
 * - Draws a playhead and auto-scrolls to follow playback.
 * - Supports click-to-seek on the timeline.
 */
export default function MidiSvgView({ song, songState, follow = true, pxPerSec, heightPerLane = 50, noteTickHeight = 15, noteHeight = 5, headerHeight = 30, tickWidth = 3, onSeek }: {
  song: Song,
  songState: SongState,
  follow?: boolean,
  pxPerSec: number,
  heightPerLane?: number,
  headerHeight?: number,
  noteTickHeight?: number,
  noteHeight?: number,
  tickWidth?: number,
  onSeek?: (t: number) => void,
}) {
  const { currentTime, isPlaying } = songState
  const duration = song.duration
  const containerRef = useRef<HTMLDivElement | null>(null)
  const svgRef = useRef<SVGSVGElement | null>(null)

  const totalWidth = Math.max(0, duration * pxPerSec)
  const lanes: { key: string, name: string, type: 'track'|'drum', index: number }[] = []
  song.tracks.forEach((tr, i) => {
    lanes.push({ key: `t${i}`, name: tr.info?.title || `Track ${i+1}`, type: 'track', index: i })
  })
  if (song.beats.length) {
    lanes.push({ key: 'drums', name: 'Drums', type: 'drum', index: 0 })
  }

  const viewHeight = lanes.length * heightPerLane + headerHeight

  // Precompute drawable notes per lane for the current view window (simple filter for now)
  const drawData = useMemo(() => {
    const rectsByLane = new Map<string, { x: number, y: number, w: number, h: number, fill: string, title: string }[]>()
    const ensure = (key: string) => {
      if (!rectsByLane.has(key)) rectsByLane.set(key, [])
      return rectsByLane.get(key)!
    }

    // Tracks
    song.tracks.forEach((tr, laneIndex) => {
      const key = `t${laneIndex}`
      let laneBaseY = (laneIndex + 1/2) * heightPerLane + headerHeight
      const fill = "blue"
      tr.notes.forEach(n => {
        const x = n.when * pxPerSec
        const w = n.duration * pxPerSec
        const title = `${tr.info?.title || 'Track'}\n${fmt(n.when)} – ${fmt(n.when + n.duration)}`
        ensure(key).push({ x, y : laneBaseY - noteHeight, w, h : noteHeight * 2, fill, title })
        ensure(key).push({ x, y : laneBaseY - noteTickHeight, w : tickWidth, h : noteTickHeight * 2, fill, title })
      })
      ensure(key).push({ x: 0, y : laneBaseY - 2 / 2, w: totalWidth, h: 2, fill: "green", title: tr.info?.title || 'Track' })
    })

    // Drums
    if (song.beats.length) {
      const key = 'drums'
      const laneIndex = song.tracks.length
      const y = laneIndex * heightPerLane + headerHeight
      const fill = "blue"
      song.beats.forEach((beat) => {
        const vol = (beat.volume ?? 2) / 2
        const notes = beat.notes || []
        for (let i = 0; i < notes.length; i++) {
          const bn = notes[i]
          const x = bn.when * pxPerSec
          const w = Math.max(2, 0.12 * pxPerSec) // short fixed width ticks
          const h = (heightPerLane - 6) * Math.max(0.5, vol)
          ensure(key).push({ x, y: y + (heightPerLane - h) / 2, w, h, fill, title: `Drum ${beat.n}\n${fmt(bn.when)}` })
        }
      })
    }

    const data: { laneKey: string, rects: { x: number, y: number, w: number, h: number, fill: string, title: string }[] }[] = []
    lanes.forEach(ln => data.push({ laneKey: ln.key, rects: rectsByLane.get(ln.key) || [] }))
    return data
  }, [lanes, song.tracks, song.beats, heightPerLane, pxPerSec])

  // Auto-scroll to follow playhead
  useEffect(() => {
    if (!follow) return
    const el = containerRef.current
    if (!el) return
    const playheadX = currentTime * pxPerSec
    const margin = el.clientWidth * 0.35
    const targetScroll = Math.max(0, playheadX - margin)
    // Smooth-ish scroll without layout thrash
    el.scrollTo({ left: targetScroll, behavior: isPlaying ? 'smooth' : 'auto' })
  }, [currentTime, follow, pxPerSec, isPlaying])

  const computeSeekTimeFromClientX = (clientX: number) => {
    const el = containerRef.current
    if (!el) return null
    const rect = el.getBoundingClientRect()
    // clientX is viewport-relative; subtract container's left and add horizontal scroll
    const x = clientX - rect.left + el.scrollLeft
    const timelineWidth = Math.max(1, totalWidth)
    const clampedX = Math.max(0, Math.min(x, timelineWidth))
    return clampedX / pxPerSec
  }

  const onBackgroundClick = (e: React.MouseEvent) => {
    if (!onSeek) return
    const t = computeSeekTimeFromClientX(e.clientX)
    if (t == null) return
    onSeek(Math.min(Math.max(0, t), duration))
  }

  return (
    <div>
      <div style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 6 }}>
        <div style={{ fontWeight: 600 }}>Visualization</div>
        <div style={{ fontSize: 12, color: '#666' }}>Click timeline to seek · Auto-follow {follow ? 'on' : 'off'}</div>
      </div>
      <div ref={containerRef} style={{ border: '1px solid #ddd', height: viewHeight, overflowX: 'auto', overflowY: 'hidden', position: 'relative', background: '#fafafa' }}>
        <svg ref={svgRef} width={totalWidth} height={viewHeight} onClick={onBackgroundClick}>
          {/* Header band with seconds ruler marks every 1s */}
          <g>
            <rect x={0} y={0} width={totalWidth} height={headerHeight - 1} fill="#f0f0f0" />
            {Array.from({ length: Math.ceil(duration + 2) }).map((_, i) => (
              <g key={i}>
                <line x1={i*pxPerSec} y1={0} x2={i*pxPerSec} y2={headerHeight - 1} stroke="#ddd" />
                <text x={i*pxPerSec + 2} y={16} fontSize={10} fill="#666">{i}s</text>
              </g>
            ))}
          </g>

          {/* Lane backgrounds and labels */}
          {lanes.map((ln, idx) => (
            <g key={ln.key}>
              <rect x={0} y={headerHeight - 1 + idx*heightPerLane} width={totalWidth} height={heightPerLane} fill={"#fcffd0"} />
              <text x={4} y={headerHeight - 1 + idx*heightPerLane + heightPerLane - 5} fontSize={10} fill="#888">{ln.name}</text>
            </g>
          ))}

          {/* Notes */}
          {drawData.map(group => (
            <g key={group.laneKey}>
              {group.rects.map((r, i) => (
                <g key={i}>
                  <rect x={r.x} y={r.y} width={r.w} height={r.h} fill={r.fill} />
                  {/* Minimal tooltip via title */}
                  <title>{r.title}</title>
                </g>
              ))}
            </g>
          ))}

          {/* Playhead */}
          <g>
            <line x1={currentTime*pxPerSec} y1={0} x2={currentTime*pxPerSec} y2={viewHeight} stroke="#e00" strokeWidth={2} />
          </g>
        </svg>
      </div>
    </div>
  )
}

function fmt(sec: number) {
  const s = Math.max(0, sec)
  const m = Math.floor(s / 60)
  const ss = Math.floor(s % 60)
  return `${m}:${String(ss).padStart(2,'0')}`
}
