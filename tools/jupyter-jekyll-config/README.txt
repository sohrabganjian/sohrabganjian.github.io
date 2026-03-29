Empty Jupyter config directory for this repository.

When Jekyll runs the jekyll-jupyter-notebook plugin, it shells out to
"jupyter nbconvert". Jupyter loads ~/.jupyter/jupyter_nbconvert_config.json
by default. If that file references optional packages (for example
jupyter_contrib_nbextensions preprocessors), nbconvert can fail or produce
blank notebook embeds even though "jupyter" works in another conda env.

Set JUPYTER_CONFIG_DIR to this folder so only stock nbconvert settings apply.
The helper scripts in scripts/jekyll-serve.ps1 and scripts/jekyll-build.ps1
do that automatically on Windows.

jupyter_nbconvert_config.py prepends nbconvert_templates/ so base/mathjax.html.j2
uses MathJax 3.2 + mathtools (same family as _config.yml third_party_libraries.mathjax),
keeping \\coloneqq in notebook HTML exports aligned with JupyterLab and the rest of the site.

If you bump site.mathjax.version in _config.yml, update the same version in
jupyter_nbconvert_config.py (HTMLExporter.mathjax_url) and in nbconvert_templates/base/mathjax.html.j2 macro default.

TeX extension lists live in _data/mathjax_jupyterlab.yml (used by the site). The same lists are duplicated in nbconvert_templates/base/mathjax.html.j2 (nbconvert cannot read Jekyll data); keep them in sync if you change extensions.

Superscripts: MathJax parses ^\\textdagger as the built-in \\text command plus “dagger”, not as \\textdagger. Use ^{\\textdagger} or ^{\\dagger} (same idea as standard LaTeX grouping). Jupyter’s UI can mask this; static HTML export does not.

The nbconvert template must set tex.inlineMath / tex.displayMath explicitly; otherwise a partial tex{} config can drop MathJax defaults and break all $...$ inline math in exported HTML.

Site-wide operator names (e.g. \\QFT): add them under operator_macros in _data/mathjax_jupyterlab.yml and mirror the same keys in nbconvert_templates/base/mathjax.html.j2 (macros) — one place for the site, one duplicate for nbconvert.
