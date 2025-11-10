import os
from pathlib import Path
from sphinx.util import logging
from sphinx.environment.adapters.toctree import TocTree
from docutils.nodes import NodeVisitor

logger = logging.getLogger(__name__)

def _make_llms_file(app, exception):
    if exception is not None:
        return

    env     = app.builder.env
    builder = app.builder
    baseurl = os.getenv("HTML_BASEURL", "https://docs.dash.org/en/stable/").rstrip("/") + "/"

    toctree = TocTree(env)
    seen = set()
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

    walk(app.config.master_doc)

    for docname in sorted(env.all_docs):
        if docname not in seen:
            ordered_docnames.append(docname)

    links = []
    md_dir = Path(builder.outdir) / "llms-md"
    md_dir.mkdir(exist_ok=True)

    for docname in ordered_docnames:
        if docname.endswith("/genindex") or docname.endswith("/search"):
            continue

        title_node = env.titles.get(docname)
        if title_node is None:
            continue

        title = title_node.astext().strip()
        uri   = baseurl + builder.get_target_uri(docname)
        links.append(f"[{title}]({uri})")

        try:
            doctree = env.get_doctree(docname)
            body = extract_text(doctree)
        except Exception as e:
            logger.warning(f"Skipping .md for {docname} (error reading doctree): {e}")
            continue

        # --- Write Markdown with frontmatter ---
        md_path = md_dir / (docname.replace("/", "_") + ".md")
        frontmatter = f"""---
title: "{title}"
url: "{uri}"
source: "{docname}"
---

"""
        md_path.write_text(frontmatter + body.strip() + "\n", encoding="utf-8")

    # Write index file
    out_path = Path(builder.outdir) / "llms-full.txt"
    out_path.write_text("\n".join(links) + "\n", encoding="utf-8")

    logger.info(f"[llms_full] Wrote llms-full.txt with {len(links)} entries (ToC order)")
    logger.info(f"[llms_full] Wrote {len(links)} per-page .md files to: {md_dir.relative_to(builder.outdir)}")

def extract_text(doctree):
    class Visitor(NodeVisitor):
        def __init__(self, document):
            super().__init__(document)
            self.text = []

        def visit_Text(self, node):
            self.text.append(node.astext())

        def unknown_visit(self, node):
            pass

    visitor = Visitor(doctree)
    doctree.walk(visitor)
    return " ".join(visitor.text)

def setup(app):
    app.connect("build-finished", _make_llms_file)
    return {
        "version": "1.0",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
