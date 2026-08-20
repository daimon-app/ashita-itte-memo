$ErrorActionPreference = 'Stop'
$index = Get-Content (Join-Path $PSScriptRoot 'index.html') -Raw
$legacy = Get-Content (Join-Path $PSScriptRoot 'genba-memo-3.html') -Raw
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
  @{ Name = 'createdAt generated'; Pass = $index -match 'createdAt:\s*new Date\(\)\.toISOString\(\)' }
)
$failed = @($checks | Where-Object { -not $_.Pass })
$checks | ForEach-Object { '{0}: {1}' -f $(if ($_.Pass) { 'PASS' } else { 'FAIL' }), $_.Name }
if ($failed.Count) { throw "Ashita Itte Memo checks failed: $($failed.Count)" }
"SUMMARY: $($checks.Count) PASS / 0 FAIL"
