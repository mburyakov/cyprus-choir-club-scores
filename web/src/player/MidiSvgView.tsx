import React, { useEffect, useMemo, useRef } from 'react'
import {Song} from "./core/MIDIFile";

/**
 * Minimal SVG visualization for the Native MIDI player.
 * - Renders per-track lanes and note rectangles.
 * - Draws a playhead and auto-scrolls to follow playback.
 * - Supports click-to-seek on the timeline.
 */
export default function MidiSvgView(props: {
  song: Song,
  currentTime: number,
  duration: number,
  isPlaying: boolean,
  follow?: boolean,
  pxPerSec?: number,
  heightPerLane?: number,
  onSeek?: (t: number) => void,
}) {
  const { song, currentTime, duration, isPlaying, onSeek } = props
  const follow = props.follow ?? true
  const pxPerSec = props.pxPerSec ?? 100
  const heightPerLane = props.heightPerLane ?? 18

  const containerRef = useRef<HTMLDivElement | null>(null)
  const svgRef = useRef<SVGSVGElement | null>(null)

  const tracks: any[] = (song?.tracks ?? []) as any[]
  const beats: any[] = (song?.beats ?? []) as any[]

  // Basic color palette inspired by legacy player
  const colors = [
    '#6aa84f', '#3c78d8', '#c27ba0', '#e69138', '#674ea7', '#cc0000', '#0b5394', '#38761d',
    '#b45f06', '#741b47', '#134f5c', '#990000', '#351c75', '#a61c00', '#1b1c1d', '#7f6000'
  ]

  const totalWidth = Math.max(0, duration * pxPerSec)
  const lanes = useMemo(() => {
    const l: { key: string, name: string, type: 'track'|'drum', index: number }[] = []
    tracks.forEach((tr, i) => {
      l.push({ key: `t${i}`, name: tr.info?.title || `Track ${i+1}`, type: 'track', index: i })
    })
    if (beats.length) l.push({ key: 'drums', name: 'Drums', type: 'drum', index: 0 })
    return l
  }, [tracks, beats])

  const viewHeight = Math.max(1, lanes.length) * heightPerLane + 24 // add small header band

  // Precompute drawable notes per lane for the current view window (simple filter for now)
  const drawData = useMemo(() => {
    const data: { laneKey: string, rects: { x: number, y: number, w: number, h: number, fill: string, title: string }[] }[] = []
    const laneMap = new Map<string, number>()
    lanes.forEach((ln, idx) => laneMap.set(ln.key, idx))

    const rectsByLane = new Map<string, { x: number, y: number, w: number, h: number, fill: string, title: string }[]>()
    const ensure = (key: string) => {
      if (!rectsByLane.has(key)) rectsByLane.set(key, [])
      return rectsByLane.get(key)!
    }

    // Tracks
    tracks.forEach((tr, ti) => {
      const key = `t${ti}`
      const y = (laneMap.get(key) || 0) * heightPerLane + 24
      const color = colors[ti % colors.length]
      const vol = (tr.volume ?? 7) / 7
      const alpha = 0.6 * Math.max(0.25, vol) // visual cue by volume
      const fill = toRGBA(color, alpha)
      const notes = tr.notes || []
      for (let i = 0; i < notes.length; i++) {
        const n = notes[i]
        const x = n.when * pxPerSec
        const w = Math.max(1, (n.duration || 0.1) * pxPerSec)
        ensure(key).push({ x, y: y + 2, w, h: heightPerLane - 4, fill, title: `${tr.info?.title || 'Track'}\n${fmt(n.when)} – ${fmt(n.when + (n.duration||0))}` })
      }
    })

    // Drums
    if (beats.length) {
      const key = 'drums'
      const y = (laneMap.get(key) || lanes.length - 1) * heightPerLane + 24
      const color = '#555'
      const fill = toRGBA(color, 0.7)
      beats.forEach((beat) => {
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

    lanes.forEach(ln => data.push({ laneKey: ln.key, rects: rectsByLane.get(ln.key) || [] }))
    return data
  }, [lanes, tracks, beats, heightPerLane, pxPerSec])

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
    onSeek(Math.min(Math.max(0, t), duration || 0))
  }

  return (
    <div>
      <div style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 6 }}>
        <div style={{ fontWeight: 600 }}>Visualization</div>
        <div style={{ fontSize: 12, color: '#666' }}>Click timeline to seek · Auto-follow {follow ? 'on' : 'off'}</div>
      </div>
      <div ref={containerRef} style={{ border: '1px solid #ddd', height: viewHeight + 6, overflowX: 'auto', overflowY: 'hidden', position: 'relative', background: '#fafafa' }}>
        <svg ref={svgRef} width={totalWidth + 200} height={viewHeight} onClick={onBackgroundClick}>
          {/* Header band with seconds ruler marks every 1s */}
          <g>
            <rect x={0} y={0} width={totalWidth + 200} height={24} fill="#f0f0f0" />
            {Array.from({ length: Math.ceil((duration || 0) + 2) }).map((_, i) => (
              <g key={i}>
                <line x1={i*pxPerSec} y1={0} x2={i*pxPerSec} y2={24} stroke="#ddd" />
                <text x={i*pxPerSec + 2} y={16} fontSize={10} fill="#666">{i}s</text>
              </g>
            ))}
          </g>

          {/* Lane backgrounds and labels */}
          {lanes.map((ln, idx) => (
            <g key={ln.key}>
              <rect x={0} y={24 + idx*heightPerLane} width={totalWidth + 200} height={heightPerLane} fill={idx % 2 === 0 ? '#ffffff' : '#fcfcfc'} />
              <text x={4} y={24 + idx*heightPerLane + heightPerLane - 5} fontSize={10} fill="#888">{ln.name}</text>
            </g>
          ))}

          {/* Notes */}
          {drawData.map(group => (
            <g key={group.laneKey}>
              {group.rects.map((r, i) => (
                <g key={i}>
                  <rect x={r.x} y={r.y} width={r.w} height={r.h} fill={r.fill} stroke="#000" strokeOpacity={0.12} />
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

function toRGBA(hex: string, alpha: number) {
  const { r, g, b } = hexToRgb(hex)
  return `rgba(${r}, ${g}, ${b}, ${alpha})`
}

function hexToRgb(hex: string) {
  const h = hex.replace('#', '')
  const bigint = parseInt(h.length === 3 ? h.split('').map(c => c + c).join('') : h, 16)
  const r = (bigint >> 16) & 255
  const g = (bigint >> 8) & 255
  const b = bigint & 255
  return { r, g, b }
}

function fmt(sec: number) {
  const s = Math.max(0, sec)
  const m = Math.floor(s / 60)
  const ss = Math.floor(s % 60)
  return `${m}:${String(ss).padStart(2,'0')}`
}
