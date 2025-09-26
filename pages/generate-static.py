import math
import os
import pathlib
import re
import shutil
import sys

import jinja2
import mido

def adjust_track(track, channel, fraction):
    result = mido.MidiTrack()
    for event in track:
        if event.is_meta:
            result.append(event.copy(time=int(int(event.time) * fraction)))
        elif event.channel is not None and event.time is not None:
            result.append(event.copy(channel = channel, time=int(int(event.time) * fraction)))
        elif event.channel is not None:
            print(f"not adjusting time for {event} with time {event.time} and channel {event.channel}")
            result.append(event.copy(channel = channel))
        elif event.time is not None:
            result.append(event.copy(time=int(int(event.time) * fraction)))
        else:
            print(f"not adjusting time for {event}")
            result.append(event)
    return result

def merge_midi_files(*args, output_path):

    inputs = [mido.MidiFile(file) for file in args]
    output_ticks_per_beat = math.lcm(*[input.ticks_per_beat for input in inputs])
    output = mido.MidiFile()
    output.ticks_per_beat = output_ticks_per_beat
    print(f"output will have ticks per beat: {output.ticks_per_beat}")
    channels_num = 0

    for input_num, input in enumerate(inputs):
        print(f"input {input_num} has ticks per beat: {input.ticks_per_beat}")
        tempo_marks = [event for track in input.tracks for event in track if event.is_meta and event.type == "set_tempo"]
        print(f"input {input_num} has tempo marks: {tempo_marks}")
        for track in input.tracks:
            output.tracks.append(adjust_track(track, channels_num, output_ticks_per_beat / input.ticks_per_beat))
            channels_num += 1

    print(f"Writing merged midi to {output_path}.")
    output.save(output_path)

if __name__ == "__main__":
    path_to_script = pathlib.Path(sys.argv[0])
    project_root = path_to_script.parent.parent

    out_root = project_root / "out" / "pages"
    os.makedirs(out_root, exist_ok=True)

    merge_midi_files(project_root / "yesterday-d-all.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=out_root / "yesterday-d-all-mixed-solo.midi")

    environment = jinja2.Environment(loader=jinja2.FileSystemLoader(project_root / "pages" / "templates"))
    template = environment.get_template("index.html")
    ly_root = project_root
    ly_root_list = list(ly_root.iterdir())
    ly_root_list.sort()
    ly_sources = [f for f in ly_root_list if f.name.endswith(".ly")]
    files = []
    for ly_source in ly_sources:
        ly_text = ly_source.read_text()
        title_found = re.search("title = [^\n]*\"(.*)\"", ly_text)
        ly_source_prefix = ly_source.name.replace(".ly", "")
        if title_found is None:
            display_name = ly_source_prefix
        else:
            display_name = title_found.groups()[0]
        item_files = []
        shutil.copy(ly_source, out_root / ly_source.name)
        pdf_outputs = [f for f in ly_root_list if f.name.endswith(".pdf") and f.name.startswith(ly_source_prefix)]
        for pdf_output in pdf_outputs:
            item_files.append({"name": pdf_output.name, "display_name": pdf_output.name})
            shutil.copy(ly_root / pdf_output, out_root / pdf_output.name)
        midi_outputs = [f for f in ly_root_list if f.name.endswith(".midi") and f.name.startswith(ly_source_prefix)]
        for midi_output in midi_outputs:
            item_files.append({"name": midi_output.name, "display_name": midi_output.name})
            shutil.copy(ly_root / midi_output, out_root / midi_output.name)
        item_data = {"name": ly_source.name, "display_name": display_name, "files": item_files}
        files.append(item_data)
    context = {
        "items": files,
    }
    content = template.render(context)
    index_page = out_root / "index.html"
    index_page.write_text(content)
