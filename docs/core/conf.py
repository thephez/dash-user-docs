# General information about the project.
project = u'Dash Core'
copyright = u'2022, Dash Core Group, Inc'
author = u'thephez'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
html_theme_options = {
    "external_links": [
        {"name": "User docs", "url": "https://docs.dash.org/"},
        {"name": "Platform docs", "url": "https://dashplatform.readme.io"},
        {"name": "Dash.org", "url": "https://www.dash.org"},
    ],
    "use_edit_page_button": True,
    "github_url": "https://github.com/dashpay/docs-core",
    "show_toc_level": 2,
    "show_nav_level": 1,
    "favicons": [
      {
         "rel": "icon",
         "sizes": "16x16",
         "href": "img/favicon-16x16.png",
      },
      {
         "rel": "icon",
         "sizes": "32x32",
         "href": "img/favicon-32x32.png",
      },
      {
         "rel": "icon",
         "sizes": "96x96",
         "href": "img/favicon-96x96.png",
      },
      {
         "rel": "icon",
         "sizes": "144x144",
         "href": "img/favicon-144x144.png",
      },
   ],
#    "navbar_start": ["navbar-logo", "languages"],
#    "navbar_center": ["languages", "navbar-nav", "languages"],
#    "navbar_end": ["navbar-icon-links", "version"],
#    "secondary_sidebar_items": ["languages", "page-toc", "edit-this-page", "sourcelink"],
#    "footer_items": ["languages", "copyright", "sphinx-version", "theme-version"],
#   "primary_sidebar_end": ["languages"],
}

html_context = {
    # "github_url": "https://github.com", # or your GitHub Enterprise site
    "github_user": "dashpay",
    "github_repo": "docs-core",
    "github_version": "18.0.0",
    "doc_path": "",
}

# Custom sidebar templates, must be a dictionary that maps document names
# to template names.
#
html_sidebars = {
    # "index": ["sidebar-main.html"],
    "**": ["sidebar-nav-bs"]
}
