import os
import re
import shutil

import jinja2

if __name__ == "__main__":
    project_root = "."

    out_root = project_root + "/out/pages"
    os.makedirs(out_root, exist_ok=True)

    environment = jinja2.Environment(loader=jinja2.FileSystemLoader(project_root + "/templates/"))
    template = environment.get_template("index.html")
    ly_root = project_root
    ly_root_list = os.listdir(ly_root)
    ly_root_list.sort()
    ly_sources = [f for f in ly_root_list if f.endswith(".ly")]
    files = []
    for ly_source in ly_sources:
        print(ly_source)
        ly_text = open(ly_root + "/" + ly_source).read()
        title_found = re.search("title = \"(.*)\"", ly_text)
        ly_source_prefix = ly_source.replace(".ly", "")
        if title_found is None:
            display_name = ly_source_prefix
        else:
            display_name = title_found.groups()[0]
        item_files = []
        shutil.copy(ly_root + "/" + ly_source, out_root + "/" + ly_source)
        pdf_outputs = [f for f in ly_root_list if f.endswith(".pdf") and f.startswith(ly_source_prefix)]
        for pdf_output in pdf_outputs:
            item_files.append({"name": pdf_output, "display_name": pdf_output})
            shutil.copy(ly_root + "/" + pdf_output, out_root + "/" + pdf_output)
        midi_outputs = [f for f in ly_root_list if f.endswith(".midi") and f.startswith(ly_source_prefix)]
        for midi_output in midi_outputs:
            item_files.append({"name": midi_output, "display_name": midi_output})
            shutil.copy(ly_root + "/" + midi_output, out_root + "/" + midi_output)
        item_data = {"name": ly_source, "display_name": display_name, "files": item_files}
        files.append(item_data)
    context = {
        "items": files,
    }
    content = template.render(context)
    index_page = out_root + "/index.html"
    open(index_page, "w").write(content)
