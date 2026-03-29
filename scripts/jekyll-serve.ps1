# Local Jekyll with notebook HTML export isolated from ~/.jupyter (Windows).
# Usage (from repo root):
#   conda activate py312_env   # or your env with jupyter + nbconvert
#   powershell -ExecutionPolicy Bypass -File .\scripts\jekyll-serve.ps1
# Optional: -Clean removes _site and .jekyll-cache before build (fixes stale notebook HTML).
param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$jupyterConfigDir = Join-Path $repoRoot "tools\jupyter-jekyll-config"
$env:JUPYTER_CONFIG_DIR = (Resolve-Path $jupyterConfigDir).Path
Set-Location $repoRoot

if ($Clean) {
    Write-Host "Removing _site and .jekyll-cache (clean notebook HTML rebuild)..."
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "_site", ".jekyll-cache"
}

Write-Host "JUPYTER_CONFIG_DIR=$($env:JUPYTER_CONFIG_DIR)"
bundle exec jekyll serve --livereload @args
