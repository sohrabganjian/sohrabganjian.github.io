# frozen_string_literal: true

# Root fix: jekyll-jupyter-notebook shells out to `jupyter nbconvert`. Without
# JUPYTER_CONFIG_DIR, Jupyter reads ~/.jupyter and falls back to nbconvert’s
# stock MathJax 2 template — a different TeX stack than JupyterLab (MathJax 3 +
# loader preloads). That mismatch is why “it works in the notebook” but not on
# the site: the notebook UI is not the same code path as default nbconvert.
#
# This hook always points Jupyter at tools/jupyter-jekyll-config/ so the
# project’s nbconvert template (MathJax 3 + JupyterLab extension list) is used,
# matching the notebook preview without per-macro hacks.
Jekyll::Hooks.register :site, :after_init do |site|
  dir = File.expand_path("tools/jupyter-jekyll-config", site.source)
  next unless File.directory?(dir)

  ENV["JUPYTER_CONFIG_DIR"] = dir
  Jekyll.logger.debug "Jupyter:", "JUPYTER_CONFIG_DIR => #{dir}"
end
