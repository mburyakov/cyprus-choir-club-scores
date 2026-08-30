import subprocess
import math
import os
import pathlib
import re
import shutil
import sys
import json

import mido
import yaml


def load_catalogs(project_root):
    catalogs = {}
    for catalog_path in sorted((project_root / "catalogs").glob("*.yaml")):
        catalog = yaml.safe_load(catalog_path.read_text())
        if not isinstance(catalog, dict) or not isinstance(catalog.get("songs"), list):
            raise ValueError(f"{catalog_path}: expected a mapping with a songs list")

        paths = []
        for entry in catalog["songs"]:
            if not isinstance(entry, dict) or not isinstance(entry.get("path"), str):
                raise ValueError(f"{catalog_path}: every song must have a path")
            relative_path = pathlib.PurePosixPath(entry["path"])
            source_path = project_root / relative_path
            if relative_path.is_absolute() or ".." in relative_path.parts:
                raise ValueError(f"{catalog_path}: path must stay inside the project: {relative_path}")
            if source_path.suffix != ".ly" or not source_path.is_file():
                raise ValueError(f"{catalog_path}: LilyPond source not found: {relative_path}")
            if relative_path.as_posix() in paths:
                raise ValueError(f"{catalog_path}: duplicate song: {relative_path}")
            paths.append(relative_path.as_posix())

        catalogs[catalog_path.stem] = {
            "title": catalog.get("title", catalog_path.stem),
            "paths": paths,
        }
    return catalogs

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
    catalogs = load_catalogs(project_root)

    out_root = project_root / "out" / "pages" / "static"

    if out_root.exists():
        shutil.rmtree(out_root)

    os.makedirs(out_root, exist_ok=True)

    merge_midi_files(project_root / "yesterday-d-all.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-all-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-S.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-S-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-A.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-A-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-AA.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-AA-mixed-solo.midi")
    merge_midi_files(project_root / "yesterday-d-B.midi", project_root / "yesterday-d-all-mixin-solo.mid", output_path=project_root / "yesterday-d-B-mixed-solo.midi")

    source_paths = dict.fromkeys(
        path
        for catalog in catalogs.values()
        for path in catalog["paths"]
    )
    ly_sources = [project_root / path for path in source_paths]
    files = []
    for ly_source in ly_sources:
        ly_root = ly_source.parent
        ly_root_list = sorted(ly_root.iterdir(), reverse=True)
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
            shutil.copy(pdf_output, out_root / pdf_output.name)
        midi_outputs = [f for f in ly_root_list if f.name.endswith(".midi") and f.name.startswith(ly_source_prefix)]
        for midi_output in midi_outputs:
            mp3_name = midi_output.name.removesuffix('.midi') + ".mp3"
            if not (ly_root / mp3_name).exists():
                subprocess.run([
                    "vlc", "-I", "dummy", midi_output.name,
                    "--sout", "#transcode{acodec=mp3,ab=128}:std{access=file,mux=dummy,dst=" + mp3_name + "}",
                    "--sout-keep", "vlc://quit"
                ], cwd=ly_root, check=True)
            index_to_insert_list = [item_file for item_file in item_files if item_file.get("pdf_name", "").removesuffix('.pdf') == midi_output.name.removesuffix('.midi')]
            if len(index_to_insert_list) > 0:
                index_to_insert_list[0]["has_midi"] = True
                index_to_insert_list[0]["midi_name"] = midi_output.name
                index_to_insert_list[0]["mp3_name"] = mp3_name
            else:
                item_files.append({"has_midi": True, "midi_name": midi_output.name, "display_name": midi_output.name, "mp3_name": mp3_name})
            shutil.copy(midi_output, out_root / midi_output.name)
            shutil.copy(ly_root / mp3_name, out_root / mp3_name)
        item_data = {"name": ly_source_prefix, "display_name": display_name, "files": item_files}
        files.append(item_data)
    for item_data in files:
        item_data["files_short"] = [item_file for item_file in item_data["files"] if item_file.get("has_pdf", False) == True or not ("-S" in item_file["midi_name"] or "-A" in item_file["midi_name"] or "-T" in item_file["midi_name"] or "-B" in item_file["midi_name"])]
    (out_root / "items.json").write_text(json.dumps(files, ensure_ascii=False, indent=2))

    shutil.copytree(project_root / "pages" / "midiplayer", out_root / "midiplayer")
    for logo in (project_root / "build" / "logo").iterdir():
        shutil.copy(logo, out_root)

if __name__ == "__main__":
    main()
