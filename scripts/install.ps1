param(
  [string]$Target = ".",
  [ValidateSet("full", "single")]
  [string]$Mode = "full",
  [switch]$Force,
  [string]$BaseUrl = ""
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

function Copy-Or-Download {
  param(
    [string]$SourceRelative,
    [string]$DestinationRelative
  )

  $destination = Join-Path $Target $DestinationRelative
  $destinationDir = Split-Path -Parent $destination
  if (-not (Test-Path $destinationDir)) {
    New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
  }

  if ((Test-Path $destination) -and (-not $Force)) {
    Write-Host "SKIP  $destination (already exists; use -Force to overwrite)"
    return
  }

  if ($BaseUrl) {
    $url = ($BaseUrl.TrimEnd('/')) + "/" + $SourceRelative.Replace('\\', '/')
    Invoke-WebRequest -Uri $url -OutFile $destination
  }
  else {
    $source = Join-Path $RepoRoot $SourceRelative
    if (-not (Test-Path $source)) {
      throw "Missing source file: $source"
    }
    Copy-Item -Force $source $destination
  }

  Write-Host "OK    $SourceRelative -> $destination"
}

if (-not (Test-Path $Target)) {
  New-Item -ItemType Directory -Force -Path $Target | Out-Null
}
$Target = (Resolve-Path $Target).Path

if ($BaseUrl) {
  Write-Host "Source: remote ($BaseUrl)"
}
else {
  Write-Host "Source: local repo ($RepoRoot)"
}
Write-Host "Target: $Target"
Write-Host "Mode: $Mode"
Write-Host ""

if ($Mode -eq "single") {
  Copy-Or-Download -SourceRelative "cursor/rules/cursor-code-partner.mdc" -DestinationRelative ".cursor/rules/cursor-code-partner.mdc"
}
else {
  Copy-Or-Download -SourceRelative "cursor/pack/AGENTS.md" -DestinationRelative "AGENTS.md"
  Copy-Or-Download -SourceRelative "cursor/pack/.cursor/rules/00-core-behavior.mdc" -DestinationRelative ".cursor/rules/00-core-behavior.mdc"
  Copy-Or-Download -SourceRelative "cursor/pack/.cursor/rules/20-debug-and-verification.mdc" -DestinationRelative ".cursor/rules/20-debug-and-verification.mdc"
  Copy-Or-Download -SourceRelative "cursor/pack/.cursor/rules/30-build-refactor-plan.mdc" -DestinationRelative ".cursor/rules/30-build-refactor-plan.mdc"
  Copy-Or-Download -SourceRelative "cursor/pack/.cursor/rules/40-research-docs-and-proposals.mdc" -DestinationRelative ".cursor/rules/40-research-docs-and-proposals.mdc"
  Write-Host ""
  Write-Host "Optional extras not installed automatically:"
  if ($BaseUrl) {
    Write-Host "- $($BaseUrl.TrimEnd('/'))/cursor/pack/USER_RULE.txt"
    Write-Host "- $($BaseUrl.TrimEnd('/'))/cursor/pack/CUSTOM_MODE_SHIPMATE.md"
  }
  else {
    Write-Host "- $(Join-Path $RepoRoot 'cursor/pack/USER_RULE.txt')"
    Write-Host "- $(Join-Path $RepoRoot 'cursor/pack/CUSTOM_MODE_SHIPMATE.md')"
  }
}
