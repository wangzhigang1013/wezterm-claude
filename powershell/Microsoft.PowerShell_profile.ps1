# PowerShell 7 Profile - 会话历史持久化配置

# ── 命令历史配置 ──────────────────────────────────────────
# 历史文件路径
$HistoryPath = "$env:USERPROFILE\.pwsh_history"

# 设置历史记录选项
$PSReadLineOptions = @{
    HistorySavePath = $HistoryPath
    HistorySaveStyle = "SaveIncrementally"
    HistoryNoDuplicates = $true
    MaximumHistoryCount = 10000
    EditMode = "Windows"
    BellStyle = "None"
}

# 应用 PSReadLine 配置
if (Get-Module -ListAvailable -Name PSReadLine) {
    Set-PSReadLineOption @PSReadLineOptions

    # Tab 补全
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

# ── 提示符美化 ──────────────────────────────────────────
function prompt {
    $location = $PWD.Path
    # 简化路径，只显示最后两级
    $parts = $location -split '\\'
    if ($parts.Count -gt 3) {
        $shortPath = "...\$($parts[-2])\$($parts[-1])"
    } else {
        $shortPath = $location
    }

    # 颜色提示符
    Write-Host "$shortPath" -NoNewline -ForegroundColor Cyan
    Write-Host " ❯" -NoNewline -ForegroundColor Magenta
    return " "
}

# ── 常用别名 ──────────────────────────────────────────
Set-Alias -Name g -Value git
Set-Alias -Name v -Value nvim
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name la -Value Get-ChildItem

# ── Claude 快捷命令（全部全自动模式）────────────────────
# c    = 启动 Claude (全自动)
# cc   = 继续上次会话 (全自动)
# cr   = 选择会话恢复 (全自动)
function c  { claude --dangerously-skip-permissions @args }
function cc { claude --continue --dangerously-skip-permissions @args }
function cr { claude --resume --dangerously-skip-permissions @args }

# ── 环境变量 ──────────────────────────────────────────
# 如果有 nvim，设置为默认编辑器
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    $env:EDITOR = "nvim"
    $env:VISUAL = "nvim"
}

Write-Host "PowerShell 7 Profile Loaded" -ForegroundColor Green
