import os
import pathlib
import re
import shutil
import sys

import jinja2

if __name__ == "__main__":
    path_to_script = pathlib.Path(sys.argv[0])
    project_root = path_to_script.parent.parent

    out_root = project_root / "out" / "pages"
    os.makedirs(out_root, exist_ok=True)

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
    print(index_page)
    open(index_page, "w").write(content)
