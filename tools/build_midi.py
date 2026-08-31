#!/usr/bin/env python3
"""Build derived MIDI mixes."""

import math
from pathlib import Path

import mido


def adjust_track(track, channel, fraction):
    result = mido.MidiTrack()
    for event in track:
        if event.is_meta:
            result.append(event.copy(time=int(int(event.time) * fraction)))
        elif event.channel is not None and event.time is not None:
            result.append(event.copy(channel=channel, time=int(int(event.time) * fraction)))
        elif event.channel is not None:
            print(f"not adjusting time for {event} with time {event.time} and channel {event.channel}")
            result.append(event.copy(channel=channel))
        elif event.time is not None:
            result.append(event.copy(time=int(int(event.time) * fraction)))
        else:
            print(f"not adjusting time for {event}")
            result.append(event)
    return result


def merge_midi_files(*inputs, output_path):
    midi_inputs = [mido.MidiFile(path) for path in inputs]
    output_ticks_per_beat = math.lcm(*[midi.ticks_per_beat for midi in midi_inputs])
    output = mido.MidiFile()
    output.ticks_per_beat = output_ticks_per_beat
    channel = 0

    for midi in midi_inputs:
        for track in midi.tracks:
            output.tracks.append(adjust_track(
                track, channel, output_ticks_per_beat / midi.ticks_per_beat,
            ))
            channel += 1

    output.save(output_path)


def main():
    project_root = Path(__file__).resolve().parent.parent
    solo = project_root / "yesterday-d-all-mixin-solo.mid"
    output = project_root / "build" / "midi-mix"
    output.mkdir(parents=True, exist_ok=True)
    for part in ("all", "S", "A", "AA", "B"):
        merge_midi_files(
            project_root / f"yesterday-d-{part}.midi",
            solo,
            output_path=output / f"yesterday-d-{part}-mixed-solo.midi",
        )


if __name__ == "__main__":
    main()
