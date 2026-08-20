$ErrorActionPreference = 'Stop'
$index = Get-Content (Join-Path $PSScriptRoot 'index.html') -Raw
$legacy = Get-Content (Join-Path $PSScriptRoot 'genba-memo-3.html') -Raw
$swPath = Join-Path $PSScriptRoot 'sw.js'
$sw = if (Test-Path $swPath) { Get-Content $swPath -Raw } else { '' }
$normalizedIndex = $index -replace "`r`n", "`n"
$normalizedLegacy = $legacy -replace "`r`n", "`n"
$checks = @(
  @{ Name = 'Canonical and compatibility copies match'; Pass = $normalizedIndex -ceq $normalizedLegacy },
  @{ Name = 'Export schema v1'; Pass = $index -match 'schemaVersion:\s*1' },
  @{ Name = 'Legacy schema v0 accepted'; Pass = $index -match '\[0, 1\]\.includes\(schemaVersion\)' },
  @{ Name = 'Import capped at 2 MiB'; Pass = $index -match 'file\.size\s*>\s*2\s*\*\s*1024\s*\*\s*1024' },
  @{ Name = 'Memo array validated'; Pass = $index -match '!Array\.isArray\(importedMemos\)' },
  @{ Name = 'Memo count capped'; Pass = $index -match 'importedMemos\.length\s*>\s*10000' },
  @{ Name = 'Mode allowlist'; Pass = $index -match "\['genba', 'work'\]\.includes" },
  @{ Name = 'Onboarding present'; Pass = $index -match "const ONBOARDING_KEY = 'genba_onboarding_seen_v1'" },
  @{ Name = 'createdAt generated'; Pass = $index -match 'createdAt:\s*new Date\(\)\.toISOString\(\)' },
  @{ Name = 'loadMemos rejects non-array storage'; Pass = ($index -match 'Array\.isArray\(parsed\)\s*\?\s*parsed\s*:\s*\[\]') -and ($legacy -match 'Array\.isArray\(parsed\)\s*\?\s*parsed\s*:\s*\[\]') },
  @{ Name = 'Service worker registered from a real file (no blob URL)'; Pass = ($index -match "serviceWorker\.register\('\./sw\.js'\)") -and ($legacy -match "serviceWorker\.register\('\./sw\.js'\)") -and ($index -notmatch 'swCode') -and ($legacy -notmatch 'swCode') },
  @{ Name = 'sw.js file present'; Pass = $sw -ne '' },
  @{ Name = 'sw.js precaches both HTML entry points'; Pass = ($sw -match "'\./index\.html'") -and ($sw -match "'\./genba-memo-3\.html'") },
  @{ Name = 'sw.js installs, activates and cleans old caches'; Pass = ($sw -match "addEventListener\('install'") -and ($sw -match "addEventListener\('activate'") -and ($sw -match 'caches\.delete') },
  @{ Name = 'sw.js serves offline fallback on fetch'; Pass = ($sw -match "addEventListener\('fetch'") -and ($sw -match 'caches\.match') }
)
$failed = @($checks | Where-Object { -not $_.Pass })
$checks | ForEach-Object { '{0}: {1}' -f $(if ($_.Pass) { 'PASS' } else { 'FAIL' }), $_.Name }
if ($failed.Count) { throw "Ashita Itte Memo checks failed: $($failed.Count)" }
"SUMMARY: $($checks.Count) PASS / 0 FAIL"
