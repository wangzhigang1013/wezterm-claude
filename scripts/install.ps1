#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Windows Claude Code 开发环境一键安装脚本

.DESCRIPTION
    自动安装并配置 Claude Code 开发环境，包括：
    - Node.js
    - Git
    - PowerShell 7
    - WezTerm 终端
    - Claude Code
    - 配置文件

.EXAMPLE
    .\install.ps1

.NOTES
    需要以管理员身份运行
    作者: WezTerm Claude Setup
    版本: 1.0.0
#>

param(
    [switch]$SkipFont,
    [switch]$SkipNode,
    [switch]$SkipGit,
    [switch]$SkipWezTerm,
    [switch]$SkipClaude
)

# ── 颜色输出函数 ──────────────────────────────────────────
function Write-Step {
    param([string]$Message, [int]$Step, [int]$Total)
    Write-Host "`n[$Step/$Total] " -ForegroundColor Cyan -NoNewline
    Write-Host $Message -ForegroundColor Yellow
}

function Write-Success {
    param([string]$Message)
    Write-Host "  ✓ $Message" -ForegroundColor Green
}

function Write-Error {
    param([string]$Message)
    Write-Host "  ✗ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "  ℹ $Message" -ForegroundColor Gray
}

# ── 检查命令是否存在 ──────────────────────────────────────
function Test-Command {
    param([string]$Command)
    $null = Get-Command $Command -ErrorAction SilentlyContinue
    return $?
}

# ── 主安装流程 ──────────────────────────────────────────
$TotalSteps = 8
$CurrentStep = 0

Write-Host "`n" -NoNewline
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     Windows Claude Code 开发环境一键安装工具            ║" -ForegroundColor Cyan
Write-Host "║     https://github.com/wangzhigang1013/wezterm-claude   ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ── 1. 检查并安装 Node.js ──────────────────────────────────
$CurrentStep++
Write-Step "检查并安装 Node.js" $CurrentStep $TotalSteps

if ($SkipNode) {
    Write-Info "跳过 Node.js 安装"
} elseif (Test-Command "node") {
    $nodeVersion = node --version
    Write-Success "Node.js 已安装: $nodeVersion"
} else {
    Write-Info "正在安装 Node.js..."
    winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Node.js 安装成功"
    } else {
        Write-Error "Node.js 安装失败，请手动安装: https://nodejs.org/"
    }
}

# ── 2. 检查并安装 Git ──────────────────────────────────────
$CurrentStep++
Write-Step "检查并安装 Git" $CurrentStep $TotalSteps

if ($SkipGit) {
    Write-Info "跳过 Git 安装"
} elseif (Test-Command "git") {
    $gitVersion = git --version
    Write-Success "Git 已安装: $gitVersion"
} else {
    Write-Info "正在安装 Git..."
    winget install Git.Git --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Git 安装成功"
    } else {
        Write-Error "Git 安装失败，请手动安装: https://git-scm.com/"
    }
}

# ── 3. 检查并安装 PowerShell 7 ─────────────────────────────
$CurrentStep++
Write-Step "检查并安装 PowerShell 7" $CurrentStep $TotalSteps

if (Test-Command "pwsh") {
    $pwshVersion = pwsh --version
    Write-Success "PowerShell 7 已安装: $pwshVersion"
} else {
    Write-Info "正在安装 PowerShell 7..."
    winget install Microsoft.PowerShell --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Success "PowerShell 7 安装成功"
    } else {
        Write-Error "PowerShell 7 安装失败，请手动安装: https://github.com/PowerShell/PowerShell"
    }
}

# ── 4. 检查并安装 WezTerm ──────────────────────────────────
$CurrentStep++
Write-Step "检查并安装 WezTerm" $CurrentStep $TotalSteps

if ($SkipWezTerm) {
    Write-Info "跳过 WezTerm 安装"
} elseif (Test-Command "wezterm") {
    $weztermVersion = wezterm --version
    Write-Success "WezTerm 已安装: $weztermVersion"
} else {
    Write-Info "正在安装 WezTerm..."
    winget install wez.wezterm --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Success "WezTerm 安装成功"
    } else {
        Write-Error "WezTerm 安装失败，请手动安装: https://wezfurlong.org/wezterm/"
    }
}

# ── 5. 复制 WezTerm 配置 ──────────────────────────────────
$CurrentStep++
Write-Step "配置 WezTerm" $CurrentStep $TotalSteps

$weztermConfigDir = "$env:USERPROFILE\.config\wezterm"

# 创建配置目录
New-Item -ItemType Directory -Path "$weztermConfigDir\config" -Force | Out-Null

# 复制配置文件
$scriptDir = Split-Path -Parent $PSScriptRoot
if (Test-Path "$scriptDir\wezterm") {
    Copy-Item "$scriptDir\wezterm\*" -Destination $weztermConfigDir -Recurse -Force
    Write-Success "WezTerm 配置文件已复制"
} else {
    Write-Error "找不到配置文件目录: $scriptDir\wezterm"
}

# ── 6. 配置 PowerShell ──────────────────────────────────────
$CurrentStep++
Write-Step "配置 PowerShell" $CurrentStep $TotalSteps

$powershellDir = "$env:USERPROFILE\Documents\PowerShell"
New-Item -ItemType Directory -Path $powershellDir -Force | Out-Null

if (Test-Path "$scriptDir\powershell\Microsoft.PowerShell_profile.ps1") {
    Copy-Item "$scriptDir\powershell\Microsoft.PowerShell_profile.ps1" -Destination $powershellDir -Force
    Write-Success "PowerShell Profile 已复制"
} else {
    Write-Error "找不到 PowerShell 配置文件"
}

# 设置执行策略
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Write-Success "PowerShell 执行策略已设置"

# ── 7. 安装 Claude Code ──────────────────────────────────────
$CurrentStep++
Write-Step "安装 Claude Code" $CurrentStep $TotalSteps

if ($SkipClaude) {
    Write-Info "跳过 Claude Code 安装"
} elseif (Test-Command "claude") {
    $claudeVersion = claude --version
    Write-Success "Claude Code 已安装: $claudeVersion"
} else {
    Write-Info "正在安装 Claude Code..."
    npm install -g @anthropic-ai/claude-code
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Claude Code 安装成功"
    } else {
        Write-Error "Claude Code 安装失败，请手动安装: npm install -g @anthropic-ai/claude-code"
    }
}

# ── 8. 安装 ccswitch ──────────────────────────────────────────
$CurrentStep++
Write-Step "安装 ccswitch (Claude Code 配置切换工具)" $CurrentStep $TotalSteps

if (Test-Command "ccswitch") {
    $ccswitchVersion = ccswitch --version 2>&1
    Write-Success "ccswitch 已安装: $ccswitchVersion"
} else {
    Write-Info "正在安装 ccswitch..."
    npm install -g ccswitch
    if ($LASTEXITCODE -eq 0) {
        Write-Success "ccswitch 安装成功"
    } else {
        Write-Error "ccswitch 安装失败，请手动安装: npm install -g ccswitch"
    }
}

# ── 安装完成 ──────────────────────────────────────────────
Write-Host "`n" -NoNewline
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                    安装完成！                            ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

Write-Host "已安装组件:" -ForegroundColor Cyan
Write-Host "  ✓ Node.js" -ForegroundColor Green
Write-Host "  ✓ Git" -ForegroundColor Green
Write-Host "  ✓ PowerShell 7" -ForegroundColor Green
Write-Host "  ✓ WezTerm 终端" -ForegroundColor Green
Write-Host "  ✓ Claude Code" -ForegroundColor Green
Write-Host "  ✓ ccswitch (配置切换)" -ForegroundColor Green
Write-Host "  ✓ WezTerm 配置" -ForegroundColor Green
Write-Host "  ✓ PowerShell Profile" -ForegroundColor Green

Write-Host "`n字体说明:" -ForegroundColor Cyan
Write-Host "  当前使用 Cascadia Code 字体（Windows 自带）" -ForegroundColor White
Write-Host "  如需 Maple Mono NF CN，请手动安装:" -ForegroundColor White
Write-Host "  https://github.com/subframe7536/maple-font/releases" -ForegroundColor Gray

Write-Host "`n快速命令:" -ForegroundColor Cyan
Write-Host "  c     = 启动 Claude (全自动)" -ForegroundColor White
Write-Host "  cc    = 继续上次会话" -ForegroundColor White
Write-Host "  cr    = 选择会话恢复" -ForegroundColor White
Write-Host "  g     = git" -ForegroundColor White

Write-Host "`n下一步:" -ForegroundColor Cyan
Write-Host "  1. 重启终端或打开 WezTerm" -ForegroundColor White
Write-Host "  2. 输入 'c' 启动 Claude Code" -ForegroundColor White
Write-Host "  3. 开始编程！" -ForegroundColor White

Write-Host "`nGitHub: https://github.com/wangzhigang1013/wezterm-claude" -ForegroundColor Gray
Write-Host ""
