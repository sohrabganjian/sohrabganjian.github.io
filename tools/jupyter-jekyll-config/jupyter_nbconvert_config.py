"""Project nbconvert settings for jekyll-jupyter-notebook.

Prepends nbconvert_templates/ so base/mathjax.html.j2 overrides the stock template
(MathJax 3 + mathtools, aligned with site _config.yml third_party_libraries.mathjax).
"""
import logging
import os
from pathlib import Path

_root = Path(__file__).resolve().parent
_tpl = _root / "nbconvert_templates"

c = get_config()

# Hide NbConvertApp "Alternative text is missing" warnings during Jekyll builds
# (add alt text in notebooks over time if you want stricter accessibility).
c.NbConvertApp.log_level = logging.ERROR

c.TemplateExporter.extra_template_basedirs = [str(_tpl), os.getcwd()]

# lab/index.html.j2 calls `mathjax(resources.mathjax_url)`; stock value is MathJax 2.7.
# Match third_party_libraries.mathjax in _config.yml (3.2.x, tex-mml-chtml).
c.HTMLExporter.mathjax_url = (
    "https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5/tex-mml-chtml.js"
)
