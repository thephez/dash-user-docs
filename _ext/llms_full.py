# docs/_ext/llms_full.py
import os
from pathlib import Path
from sphinx.util import logging
from sphinx.environment.adapters.toctree import TocTree

logger = logging.getLogger(__name__)

def _make_llms_file(app, exception):
    if exception is not None:
        return

    env     = app.builder.env
    builder = app.builder
    # Use environment variable or default to localhost for local builds
    baseurl = os.getenv("HTML_BASEURL", "https://docs.dash.org/en/stable/")

    # Traverse from the root document using the toctree adapter
    toctree = TocTree(env)
    seen    = set()
    ordered_docnames = []

    def walk(docname):
        if docname in seen:
            return
        seen.add(docname)
        ordered_docnames.append(docname)
        for child in toctree.get_toctree_for(docname, builder, collapse=False).traverse():
            if child.tagname == "reference" and 'refuri' not in child:
                ref = child.get("refuri") or child.get("refid")
                if ref and ref in env.all_docs:
                    walk(ref)

    root_doc = app.config.master_doc
    walk(root_doc)

    # Fall back on any missing docs
    for docname in sorted(env.all_docs):
        if docname not in seen:
            ordered_docnames.append(docname)

    lines = []
    for docname in ordered_docnames:
        if docname.endswith("/genindex") or docname.endswith("/search"):
            continue

        title_node = env.titles.get(docname)
        if title_node is None:
            continue

        title = title_node.astext().strip()
        uri   = baseurl + builder.get_target_uri(docname)
        lines.append(f"[{title}]({uri})")

    out_path = Path(builder.outdir) / "llms-full.txt"
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    logger.info(f"[llms_full] Wrote llms-full.txt with {len(lines)} entries (ToC order)")

def setup(app):
    app.connect("build-finished", _make_llms_file)
