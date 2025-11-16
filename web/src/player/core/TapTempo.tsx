import React, {useState, useEffect, MouseEventHandler, KeyboardEventHandler} from "react";
import styled from "styled-components";

// -----------------------------------------------------------------------------

const TapMe = styled.button<{ theme?: any }>`
  font-size: 3.3125rem;
  float: left;
  width: 150px;
  height: 150px;
  color: red;
  background-color: ${({ theme }) => (theme ? theme.background : "white")};
  border: 1px solid black;
  outline: none;

  -webkit-touch-callout: none; /* iOS Safari */
  -webkit-user-select: none; /* Safari */
  -khtml-user-select: none; /* Konqueror HTML */
  -moz-user-select: none; /* Firefox */
  -ms-user-select: none; /* Internet Explorer/Edge */
  user-select: none; /* Non-prefixed version, currently supported by Chrome and Opera */

  :active {
    border-color: red;
  }
`;

const TapMeContainer = styled.div`
  width: 150px;
`;

// -----------------------------------------------------------------------------

const MAX_TAPS = 50;
const initialTaps: TapInfo[] = [];
const initialTempo = 0;

export type TapInfo = {
  time: number;
  beatTime: number;
}

type TapTempoProps = { callback: (previousTaps: TapInfo[]) => number }

const TapTempo: React.FC<TapTempoProps> = (props) => {
  const [taps, setTaps] = useState<TapInfo[]>(initialTaps);
  const [tempo, setTempo] = useState<number>(initialTempo);

  const handleMouseEvent: MouseEventHandler<HTMLButtonElement> = (e) => {
    handleTap(e.type === "mousedown", false)
  }

  const handleKeyEvent: KeyboardEventHandler<HTMLButtonElement> = (e) => {
    if (e.repeat) return
    e.key === "Enter" && e.preventDefault();
    handleTap(e.type === "keydown", true)
  }

  const handleTap = (down: boolean, key: boolean): void => {
    console.log(`tap ${down ? "down" : "up"} ${key ? "key" : "mouse"}`)
    const beatTime = props.callback(taps)
    setTaps(prevTaps => {
      let tapInfo = {
        time: Date.now(),
        beatTime: beatTime
      };
      const next = [...prevTaps, tapInfo];
      // keep array from growing unbounded
      if (next.length > MAX_TAPS) next.shift();
      return next;
    });
  };

  const handleReset = (): void => {
    setTaps(initialTaps);
    setTempo(initialTempo);
  };

  useEffect(() => {
    let nextTempo = 0;
    if (taps.length > 1) {
      const firstTime = taps[0];
      const lastTime = taps[taps.length - 1];
      const avgIntervalMs = (lastTime.time - firstTime.time) / (taps.length - 1);
      if (avgIntervalMs > 0 && isFinite(avgIntervalMs)) {
        nextTempo = Math.floor((1000 * 60) / avgIntervalMs);
      }
    }
    setTempo(nextTempo);
  }, [taps]);

  return (
    <TapMeContainer>
      <TapMe type="button" onMouseDown={handleMouseEvent} onMouseUp={handleMouseEvent} onKeyDown={handleKeyEvent} onKeyUp={handleKeyEvent}>
        {tempo}
      </TapMe>
      <button type="button" onClick={handleReset}>
        Reset
      </button>
    </TapMeContainer>
  );
};

// -----------------------------------------------------------------------------

export default TapTempo;