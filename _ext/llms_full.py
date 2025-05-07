# docs/_ext/llms_full.py
from pathlib import Path
from sphinx.util import logging

def _make_llms_file(app, exception):
    logger = logging.getLogger(__name__)

    if exception is not None:
        return

    env     = app.builder.env
    builder = app.builder
    baseurl = app.config.html_baseurl.rstrip('/') + '/'

    lines = []
    for docname in sorted(env.all_docs):
        if docname.endswith('/genindex') or docname.endswith('/search'):
            continue

        title_node = env.titles.get(docname)
        if title_node is None:
            continue

        title = title_node.astext().strip()
        uri   = baseurl + builder.get_target_uri(docname)
        lines.append(f'[{title}]({uri})')

    out_path = Path(builder.outdir) / "llms-full.txt"
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    logger.info(f"[llms_full] Wrote llms-full.txt with {len(lines)} entries")

def setup(app):
    app.connect("build-finished", _make_llms_file)
