# Test Install Script

Write-Host "`n=== Test Install Script ===" -ForegroundColor Cyan

$tests = @(
    @{ Name = "Node.js"; Command = "node"; Version = "node --version" },
    @{ Name = "npm"; Command = "npm"; Version = "npm --version" },
    @{ Name = "Git"; Command = "git"; Version = "git --version" },
    @{ Name = "PowerShell 7"; Command = "pwsh"; Version = "pwsh --version" },
    @{ Name = "WezTerm"; Command = "wezterm"; Version = "wezterm --version" },
    @{ Name = "Claude Code"; Command = "claude"; Version = "claude --version" }
)

$passed = 0
$failed = 0

foreach ($test in $tests) {
    Write-Host "`nChecking $($test.Name)..." -ForegroundColor Yellow
    $command = Get-Command $test.Command -ErrorAction SilentlyContinue

    if ($command) {
        try {
            $ver = Invoke-Expression $test.Version 2>&1
            Write-Host "  OK: $ver" -ForegroundColor Green
            $passed++
        } catch {
            Write-Host "  OK: (version unknown)" -ForegroundColor Green
            $passed++
        }
    } else {
        Write-Host "  FAIL: Not installed" -ForegroundColor Red
        $failed++
    }
}

# Check config files
Write-Host "`nChecking config files..." -ForegroundColor Yellow

$configPaths = @(
    "$env:USERPROFILE\.config\wezterm\wezterm.lua",
    "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
)

foreach ($path in $configPaths) {
    if (Test-Path $path) {
        Write-Host "  OK: $path" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "  FAIL: $path" -ForegroundColor Red
        $failed++
    }
}

# Check font
Write-Host "`nChecking font..." -ForegroundColor Yellow
$fontPath = "$env:USERPROFILE\.config\wezterm\fonts"
if (Test-Path "$fontPath\MapleMono-NF-CN-Regular.ttf") {
    Write-Host "  OK: Maple Mono font exists" -ForegroundColor Green
    $passed++
} else {
    Write-Host "  FAIL: Maple Mono font missing" -ForegroundColor Red
    $failed++
}

# Summary
Write-Host "`n=== Test Results ===" -ForegroundColor Cyan
Write-Host "Passed: $passed" -ForegroundColor Green
Write-Host "Failed: $failed" -ForegroundColor $(if ($failed -eq 0) { "Green" } else { "Red" })

if ($failed -eq 0) {
    Write-Host "`nAll tests passed! Environment is configured correctly." -ForegroundColor Green
} else {
    Write-Host "`n$failed tests failed. Run install.ps1 to install missing components." -ForegroundColor Red
}

Write-Host ""
