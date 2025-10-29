import subprocess
import math
import os
import pathlib
import re
import shutil
import sys
import json

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
    # print(f"output will have ticks per beat: {output.ticks_per_beat}")
    channels_num = 0

    for input_num, input in enumerate(inputs):
        # print(f"input {input_num} has ticks per beat: {input.ticks_per_beat}")
        tempo_marks = [event for track in input.tracks for event in track if event.is_meta and event.type == "set_tempo"]
        # print(f"input {input_num} has tempo marks: {tempo_marks}")
        for track in input.tracks:
            output.tracks.append(adjust_track(track, channels_num, output_ticks_per_beat / input.ticks_per_beat))
            channels_num += 1

    # print(f"Writing merged midi to {output_path}.")
    output.save(output_path)

def main():
    path_to_script = pathlib.Path(sys.argv[0])
    project_root = path_to_script.parent.parent

    out_root = project_root / "out" / "pages" / "static"

    if out_root.exists():
        shutil.rmtree(out_root)

    os.makedirs(out_root, exist_ok=True)

    merge_midi_files(project_root / "yesterday-d-all.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-all-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-S.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-S-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-A.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-A-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-AA.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-AA-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-B.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-B-mixed-solo.midi")

    environment = jinja2.Environment(loader=jinja2.FileSystemLoader(project_root / "pages" / "templates"))
    index_template = environment.get_template("index.html")
    item_template = environment.get_template("item.html")
    ly_root = project_root
    ly_root_list = list(ly_root.iterdir())
    ly_root_list.sort(reverse=True)
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
        pdf_outputs = [f for f in ly_root_list if f.name.endswith(".pdf") and f.name.startswith(ly_source_prefix)]
        for pdf_output in pdf_outputs:
            item_files.append({"has_pdf": True, "pdf_name": pdf_output.name, "display_name": pdf_output.name})
            shutil.copy(ly_root / pdf_output, out_root / pdf_output.name)
        midi_outputs = [f for f in ly_root_list if f.name.endswith(".midi") and f.name.startswith(ly_source_prefix)]
        for midi_output in midi_outputs:
            mp3_name = midi_output.name.removesuffix('.midi') + ".mp3"
            # subprocess.run(["vlc", "-I" "dummy", midi_output.name, "--sout", "#transcode{acodec=mp3,ab=128}:std{access=file,mux=dummy,dst=" + mp3_name + "}", "--sout-keep", "vlc://quit"])
            index_to_insert_list = [item_file for item_file in item_files if item_file.get("pdf_name", "").removesuffix('.pdf') == midi_output.name.removesuffix('.midi')]
            if len(index_to_insert_list) > 0:
                index_to_insert_list[0]["has_midi"] = True
                index_to_insert_list[0]["midi_name"] = midi_output.name
                index_to_insert_list[0]["mp3_name"] = mp3_name
            else:
                item_files.append({"has_midi": True, "midi_name": midi_output.name, "display_name": midi_output.name, "mp3_name": mp3_name})
            shutil.copy(ly_root / midi_output.name, out_root / midi_output.name)
            # shutil.copy(ly_root / mp3_name, out_root / mp3_name)
        item_data = {"name": ly_source_prefix, "display_name": display_name, "files": item_files}
        item_page_content = item_template.render({ "item": item_data })
        item_page = out_root / f"{ly_source_prefix}.html"
        item_page.write_text(item_page_content)
        files.append(item_data)
    for item_data in files:
        item_data["files_short"] = [item_file for item_file in item_data["files"] if item_file.get("has_pdf", False) == True or not ("-S" in item_file["midi_name"] or "-A" in item_file["midi_name"] or "-T" in item_file["midi_name"] or "-B" in item_file["midi_name"])]
    winter_event_files = [item_data for item_data in files if item_data["name"] in ["zivijo", "vilo-moja", "yesterday", "carol-of-the-bells"]]
    winter_index_page_content = index_template.render({ "items": winter_event_files})
    index_page_content = index_template.render({ "items": files })
    (out_root / "index.html").write_text(index_page_content)
    (out_root / "winter-event.html").write_text(winter_index_page_content)

    (out_root / "winter-event.json").write_text(json.dumps(winter_event_files, ensure_ascii=False, indent=2))
    (out_root / "items.json").write_text(json.dumps(files, ensure_ascii=False, indent=2))

    shutil.copytree(project_root / "pages" / "midiplayer", out_root / "midiplayer")
    shutil.copy(project_root / "include" / "cyprus-accolada.svg", out_root / "cyprus-accolada.svg")

if __name__ == "__main__":
    main()