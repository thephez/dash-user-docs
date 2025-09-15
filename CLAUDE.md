# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the official Dash user documentation repository, built with Sphinx and hosted at <https://docs.dash.org>. The documentation uses a mix of reStructuredText (primary) and Markdown (via MyST parser) to cover all aspects of the Dash ecosystem for end users.

## Essential Commands

```bash
# Environment setup (Python 3.13 required for production compatibility)
python3.13 -m venv venv/
source ./venv/bin/activate
pip install -r requirements.txt

# Build documentation
make html

# Clean rebuild (recommended after content changes)
rm -r _build/ || true && make html

# View documentation: open _build/html/index.html in browser
```

## Architecture and Structure

**Documentation Framework**: Sphinx with pydata_sphinx_theme, supporting both RST and Markdown
**Content Organization**:

* `docs/user/` - Main user documentation (wallets, masternodes, governance, etc.)
* `docs/core/` - Core developer documentation
* `_static/` - Custom CSS, JS, and static assets
* `_templates/` - Custom Sphinx templates
* `locale/` - Translation files (Transifex integration)

**Key Configuration**:

* `conf.py` - Main Sphinx configuration with extensive theme customization
* `requirements.in` - Source dependencies (edit this, not requirements.txt)
* `.readthedocs.yml` - Read the Docs hosting configuration

## Development Workflow

**Package Management**: Uses pip-tools for dependency management

* Add packages: Edit `requirements.in` → run `pip-compile` → install from `requirements.txt`
* Update packages: `pip-compile --upgrade` or `pip-compile --upgrade-package <package>`

**Content Standards**:

* Primary format: reStructuredText (.rst)
* Secondary format: Markdown (.md) with MyST parser support
* Follow existing hierarchical structure under `docs/user/`

## Key Scripts

**Documentation Maintenance**:

* `scripts/generate-sidebar.py` - Extracts and generates sidebar navigation
* `scripts/sync_sidebar.py` - Synchronizes sidebar across documentation sections

**Automated Updates** (via GitHub Actions):

* `scripts/dashmate-update.sh` - Updates Dashmate documentation
* `scripts/core-download-link-update.sh` - Updates Dash Core download links
* `scripts/evo-tool-download-link-update.sh` - Updates Evo tool download links
* `scripts/dip-format.sh` - Processes Dash Improvement Proposals

## Important Notes

* Always use Python 3.13 for compatibility with production hosting
* Search functionality is disabled in local builds but works on hosted version
* Repository integrates with Platform documentation via intersphinx
* Clean rebuilds are essential when modifying content structure or navigation
* Translations are managed through Transifex, not directly in this repository
