# Local Jekyll build with notebook HTML export isolated from ~/.jupyter (Windows).
param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$jupyterConfigDir = Join-Path $repoRoot "tools\jupyter-jekyll-config"
$env:JUPYTER_CONFIG_DIR = (Resolve-Path $jupyterConfigDir).Path
Set-Location $repoRoot

if ($Clean) {
    Write-Host "Removing _site and .jekyll-cache..."
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "_site", ".jekyll-cache"
}

Write-Host "JUPYTER_CONFIG_DIR=$($env:JUPYTER_CONFIG_DIR)"
bundle exec jekyll build @args
