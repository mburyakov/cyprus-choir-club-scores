import React, {useRef, useState} from 'react'
import ReactModal from 'react-modal';

export type NoteEvent = { envelopeAppeared: number, envelopeDisappeared: number, startTimeAbs: number, stopTimeAbs: number, cancel: boolean, noteId: string }

export type NoteEventLog = {
  events: NoteEvent[],
}

export default function MidiTimePlot({noteEventLog, pxPerSec = 20}: { noteEventLog: NoteEventLog, pxPerSec?: number }) {
  const containerRef = useRef<HTMLDivElement | null>(null)
  const svgRef = useRef<SVGSVGElement | null>(null)

  const viewSize = 200

  const timeMin = pxPerSec * (-1 + Math.min(...noteEventLog.events.map(e => Math.min(e.startTimeAbs, e.envelopeAppeared))))
  const timeMax = pxPerSec * (1 + Math.max(...noteEventLog.events.map(e => Math.max(e.stopTimeAbs, e.envelopeDisappeared))))
  const timeWindow = pxPerSec * 5

  const [showModal, setShowModal] = useState<boolean>(false)

  function PlotSvg() {
    return <g>
      <line x1={timeMin} y1={timeMin} x2={timeMax} y2={timeMax} stroke={"black"} strokeWidth={0.5}></line>
      {noteEventLog.events.map((e, idx) => (
        <g key={idx}>
          <rect x={e.startTimeAbs * pxPerSec} y={e.envelopeAppeared * pxPerSec - 0.5} width={(e.stopTimeAbs - e.startTimeAbs)  * pxPerSec} height={1} fill={"#ff00ff10"} />
          <circle cx={e.startTimeAbs * pxPerSec} cy={e.envelopeDisappeared * pxPerSec} r={1} fill={e.cancel ? "#00ffff20" : "#0000ffff"} name={e.noteId} />
        </g>
      ))}
    </g>
  }

  return (
    <div>
      <div onClick={() => setShowModal(true)} ref={containerRef} style={{ border: '1px solid #ddd', height: viewSize, width: viewSize, overflowX: 'auto', overflowY: 'hidden', position: 'relative', background: '#fafafa' }}>
        <svg ref={svgRef} viewBox={`${timeMax - timeWindow} ${timeMax - timeWindow} ${timeWindow} ${timeWindow}`}>
          <PlotSvg/>
        </svg>
      </div>
      <ReactModal isOpen={showModal} shouldCloseOnOverlayClick={true} onRequestClose={() => setShowModal(false)}>
        <svg ref={svgRef} viewBox={`${timeMin} ${timeMin} ${timeMax - timeMin} ${timeMax - timeMin}`}>
          <PlotSvg/>
        </svg>
      </ReactModal>
    </div>
  )
}