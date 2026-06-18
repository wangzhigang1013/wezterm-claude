# Windows 环境下快速开始 Claude Code 编程指南

> 本指南将帮助你在 Windows 系统上搭建一个完整的 Claude Code 开发环境，包括终端、字体、Claude Code 及相关工具的安装与配置。

---

## 📋 目录

1. [环境概览](#1-环境概览)
2. [安装顺序](#2-安装顺序)
3. [安装 Node.js](#3-安装-nodejs)
4. [安装 Git](#4-安装-git)
5. [安装 PowerShell 7](#5-安装-powershell-7)
6. [安装 WezTerm 终端](#6-安装-wezterm-终端)
7. [安装字体](#7-安装字体)
8. [配置 WezTerm](#8-配置-wezterm)
9. [配置 PowerShell](#9-配置-powershell)
10. [安装 Claude Code](#10-安装-claude-code)
11. [安装 ccswitch](#11-安装-ccswitch)
12. [常用命令速查](#12-常用命令速查)
13. [故障排除](#13-故障排除)

---

## 1. 环境概览

| 组件 | 用途 | 版本要求 |
|------|------|----------|
| **Windows 10/11** | 操作系统 | 10 21H2+ 或 11 |
| **Node.js** | Claude Code 运行环境 | 18+ |
| **Git** | 版本控制 | 最新版 |
| **PowerShell 7** | 终端 Shell | 7.4+ |
| **WezTerm** | 终端模拟器 | 最新版 |
| **Maple Mono NF CN** | 编程字体 | 最新版 |
| **Claude Code** | AI 编程助手 | 最新版 |
| **ccswitch** | Claude API 切换工具 | 最新版 |

---

## 2. 安装顺序

**请严格按照以下顺序安装：**

```
1. Node.js          ← 基础依赖
2. Git              ← 版本控制
3. PowerShell 7     ← 终端 Shell
4. WezTerm          ← 终端模拟器
5. 字体             ← 界面显示
6. 配置 WezTerm     ← 终端美化
7. 配置 PowerShell  ← Shell 优化
8. Claude Code      ← AI 助手
9. ccswitch         ← API 切换
```

---

## 3. 安装 Node.js

Claude Code 依赖 Node.js 运行环境。

### 方法一：使用 winget（推荐）

```powershell
winget install OpenJS.NodeJS.LTS
```

### 方法二：手动下载

1. 访问 https://nodejs.org/
2. 下载 **LTS（长期支持版）**
3. 运行安装程序，按默认选项安装

### 验证安装

```powershell
node --version    # 应显示 v18.x.x 或更高
npm --version     # 应显示 9.x.x 或更高
```

---

## 4. 安装 Git

Git 是版本控制工具，也是许多开发工具的基础依赖。

### 方法一：使用 winget（推荐）

```powershell
winget install Git.Git
```

### 方法二：手动下载

1. 访问 https://git-scm.com/download/win
2. 下载并安装

### 验证安装

```powershell
git --version     # 应显示 git version 2.x.x
```

### 配置 Git（首次使用）

```powershell
git config --global user.name "你的名字"
git config --global user.email "你的邮箱@example.com"
```

---

## 5. 安装 PowerShell 7

PowerShell 7 是跨平台的现代 Shell，比自带的 Windows PowerShell 5.1 更强大。

### 方法一：使用 winget（推荐）

```powershell
winget install Microsoft.PowerShell
```

### 方法二：手动下载

1. 访问 https://github.com/PowerShell/PowerShell/releases
2. 下载最新的 `.msi` 安装包
3. 运行安装程序

### 验证安装

```powershell
pwsh --version    # 应显示 PowerShell 7.x.x
```

### 安装 PSReadLine 模块（命令行增强）

```powershell
Install-Module PSReadLine -Force -AllowPrerelease
```

---

## 6. 安装 WezTerm

WezTerm 是一个用 Rust 编写的高性能终端模拟器，支持 GPU 加速、多路复用等特性。

### 方法一：使用 winget（推荐）

```powershell
winget install wez.wezterm
```

### 方法二：手动下载

1. 访问 https://wezfurlong.org/wezterm/installation.html
2. 下载 Windows 版本的安装包
3. 运行安装程序

### 验证安装

```powershell
wezterm --version
```

---

## 7. 安装字体

### 下载 Maple Mono NF CN 字体

1. 访问 https://github.com/subframe7536/maple-font/releases
2. 下载 `MapleMono-NF-CN.zip`（包含中文和 Nerd Font 图标）
3. 解压后选中所有 `.ttf` 文件
4. 右键 → **为所有用户安装**

### 备选字体

如果不想用 Maple Mono，以下字体也可以：

| 字体 | 特点 | 下载地址 |
|------|------|----------|
| **Cascadia Code** | 微软出品，Windows Terminal 默认 | https://github.com/microsoft/cascadia-code/releases |
| **JetBrains Mono** | JetBrains 出品，代码专用 | https://www.jetbrains.com/lp/mono/ |
| **Fira Code** | 经典编程字体，支持连字 | https://github.com/tonsky/FiraCode/releases |

---

## 8. 配置 WezTerm

### 8.1 创建配置目录

```powershell
mkdir -Force "$env:USERPROFILE\.config\wezterm\config"
mkdir -Force "$env:USERPROFILE\.config\wezterm\fonts"
```

### 8.2 复制配置文件

将本指南附带的配置文件复制到对应位置：

```
C:\Users\你的用户名\.config\wezterm\
├── wezterm.lua              # 入口文件
├── fonts\                   # 字体文件（可选）
└── config\
    ├── constants.lua        # 常量定义
    ├── utils.lua            # 工具函数
    ├── fonts.lua            # 字体配置
    ├── appearance.lua       # 外观设置
    ├── window.lua           # 窗口行为
    ├── tab_bar.lua          # 标签栏样式
    ├── cursor.lua           # 光标配置
    ├── keybindings.lua      # 快捷键映射
    ├── mouse.lua            # 鼠标操作
    ├── shell.lua            # 默认 Shell
    ├── launch_menu.lua      # 启动菜单
    ├── events.lua           # 事件处理
    ├── advanced.lua         # 高级设置
    └── hyperlink.lua        # 超链接规则
```

### 8.3 主要配置说明

| 配置项 | 当前值 | 说明 |
|--------|--------|------|
| 配色方案 | Catppuccin Mocha | 深色主题 |
| 透明度 | 88% | 微透明效果 |
| 字体 | Maple Mono NF CN | 带中文和图标 |
| 字体大小 | 13.5 | 适中大小 |
| 默认 Shell | PowerShell 7 | 现代 Shell |
| GPU 渲染 | WebGpu | 高性能 |

---

## 9. 配置 PowerShell

### 9.1 创建 Profile 文件

```powershell
# 确保目录存在
mkdir -Force "$env:USERPROFILE\Documents\PowerShell"

# 创建 Profile 文件
notepad "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

### 9.2 复制配置内容

将本指南附带的 `Microsoft.PowerShell_profile.ps1` 内容复制到上述文件中。

### 9.3 配置内容说明

```powershell
# 命令历史持久化
# 历史保存在: ~/.pwsh_history

# 提示符美化
# 显示简短路径 + 彩色提示符

# 常用别名
# g  = git
# v  = nvim
# ll = Get-ChildItem

# Claude 快捷命令
# c  = claude --dangerously-skip-permissions
# cc = claude --continue --dangerously-skip-permissions
# cr = claude --resume --dangerously-skip-permissions
```

### 9.4 允许执行脚本

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 10. 安装 Claude Code

### 方法一：npm 全局安装（推荐）

```powershell
npm install -g @anthropic-ai/claude-code
```

### 方法二：使用官方安装脚本

```powershell
# macOS/Linux 风格（Windows 也支持）
curl -fsSL https://claude.ai/install.sh | powershell
```

### 验证安装

```powershell
claude --version
```

### 首次启动

```powershell
claude
```

首次启动会要求登录 Anthropic 账号进行认证。

### Claude Code 常用参数

| 参数 | 说明 |
|------|------|
| `claude` | 正常启动 |
| `claude --dangerously-skip-permissions` | 跳过权限确认（全自动模式） |
| `claude --continue` | 继续上次会话 |
| `claude --resume` | 选择历史会话恢复 |
| `claude --version` | 显示版本号 |
| `claude --help` | 显示帮助 |

---

## 11. 安装 ccswitch

ccswitch 是一个用于在不同 Claude API 提供商之间切换的工具。

### 安装

```powershell
npm install -g @anthropic-ai/claude-code-switch
# 或者
npm install -g ccswitch
```

### 使用方法

```powershell
# 查看当前配置
ccswitch status

# 切换到不同的 API 端点
ccswitch switch

# 设置 API Key
ccswitch set-key <your-api-key>
```

### 环境变量方式

也可以直接设置环境变量来切换 API：

```powershell
# 设置 API Key
$env:ANTHROPIC_API_KEY = "your-api-key"

# 设置自定义 API 端点（如果使用代理）
$env:ANTHROPIC_BASE_URL = "https://your-proxy.com/v1"
```

---

## 12. 常用命令速查

### WezTerm 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+T` | 新建标签页 |
| `Ctrl+W` | 关闭当前窗格 |
| `Ctrl+Shift+W` | 关闭整个标签页 |
| `Ctrl+Tab` | 下一个标签页 |
| `Ctrl+Shift+Tab` | 上一个标签页 |
| `Ctrl+Alt+\` | 垂直分割 |
| `Ctrl+Alt+-` | 水平分割 |
| `Alt+方向键` | 切换窗格焦点 |
| `Ctrl+Shift+方向键` | 调整窗格大小 |
| `Ctrl+Shift+P` | 启动菜单 |
| `Ctrl+Shift+F` | 搜索 |
| `Ctrl+Shift+C` | 复制 |
| `Ctrl+Shift+V` | 粘贴 |
| `Ctrl+V` | 粘贴（支持图片） |
| `Ctrl+Shift+S` | 切换配色方案 |
| `F11` | 全屏切换 |
| `Ctrl+Shift+R` | 重命名标签页 |

### PowerShell 快捷命令

| 命令 | 功能 |
|------|------|
| `c` | 启动 Claude（全自动） |
| `cc` | 继续上次会话（全自动） |
| `cr` | 选择会话恢复（全自动） |
| `g` | git 的简写 |
| `v` | nvim 的简写 |
| `ll` | 列出文件 |

### PowerShell 常用操作

| 操作 | 命令 |
|------|------|
| 切换目录 | `cd D:\project` |
| 切换盘符 | `D:` |
| 返回上级 | `cd ..` |
| 回到主目录 | `cd ~` |
| 列出文件 | `ls` 或 `ll` |
| 清屏 | `clear` 或 `cls` |
| 查看历史 | `history` |

---

## 13. 故障排除

### Claude Code 无法启动

```powershell
# 检查 Node.js 版本
node --version

# 重新安装
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code

# 检查 PATH
echo $env:PATH
```

### WezTerm 配置不生效

```powershell
# 检查配置文件路径
ls "$env:USERPROFILE\.config\wezterm\wezterm.lua"

# 重启 WezTerm 或按 Ctrl+Shift+R 重载配置
```

### 字体显示异常

1. 确认字体已安装到系统
2. 在 WezTerm 中按 `Ctrl+Shift+S` 切换配色方案
3. 检查 `config/fonts.lua` 中的字体名称是否正确

### PowerShell Profile 不生效

```powershell
# 检查 Profile 路径
$PROFILE

# 检查执行策略
Get-ExecutionPolicy

# 设置执行策略
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 重新加载 Profile
. $PROFILE
```

### npm 安装很慢

```powershell
# 使用国内镜像
npm config set registry https://registry.npmmirror.com

# 或者使用 cnpm
npm install -g cnpm --registry=https://registry.npmmirror.com
```

---

## 📦 快速安装脚本

将以下内容保存为 `setup.ps1`，以管理员身份运行：

```powershell
# Windows Claude Code 环境快速安装脚本

Write-Host "=== 开始安装 Claude Code 开发环境 ===" -ForegroundColor Cyan

# 1. 安装 Node.js
Write-Host "[1/8] 安装 Node.js..." -ForegroundColor Yellow
winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements

# 2. 安装 Git
Write-Host "[2/8] 安装 Git..." -ForegroundColor Yellow
winget install Git.Git --accept-package-agreements --accept-source-agreements

# 3. 安装 PowerShell 7
Write-Host "[3/8] 安装 PowerShell 7..." -ForegroundColor Yellow
winget install Microsoft.PowerShell --accept-package-agreements --accept-source-agreements

# 4. 安装 WezTerm
Write-Host "[4/8] 安装 WezTerm..." -ForegroundColor Yellow
winget install wez.wezterm --accept-package-agreements --accept-source-agreements

# 5. 安装 PSReadLine
Write-Host "[5/8] 安装 PSReadLine..." -ForegroundColor Yellow
Install-Module PSReadLine -Force -AllowPrerelease -Scope CurrentUser

# 6. 安装 Claude Code
Write-Host "[6/8] 安装 Claude Code..." -ForegroundColor Yellow
npm install -g @anthropic-ai/claude-code

# 7. 创建配置目录
Write-Host "[7/8] 创建配置目录..." -ForegroundColor Yellow
mkdir -Force "$env:USERPROFILE\.config\wezterm\config"
mkdir -Force "$env:USERPROFILE\.config\wezterm\fonts"
mkdir -Force "$env:USERPROFILE\Documents\PowerShell"

# 8. 设置执行策略
Write-Host "[8/8] 设置 PowerShell 执行策略..." -ForegroundColor Yellow
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host "=== 安装完成！===" -ForegroundColor Green
Write-Host ""
Write-Host "请完成以下步骤：" -ForegroundColor Cyan
Write-Host "1. 安装字体：下载 Maple Mono NF CN 并安装" -ForegroundColor White
Write-Host "2. 复制 WezTerm 配置文件到 ~/.config/wezterm/" -ForegroundColor White
Write-Host "3. 复制 PowerShell Profile 到 ~/Documents/PowerShell/" -ForegroundColor White
Write-Host "4. 重启终端" -ForegroundColor White
```

---

## 🔗 相关链接

| 工具 | 链接 |
|------|------|
| Node.js | https://nodejs.org/ |
| Git | https://git-scm.com/ |
| PowerShell | https://github.com/PowerShell/PowerShell |
| WezTerm | https://wezfurlong.org/wezterm/ |
| Claude Code | https://docs.anthropic.com/en/docs/claude-code |
| Maple Mono 字体 | https://github.com/subframe7536/maple-font |
| Catppuccin 主题 | https://catppuccin.com/ |

---

## 📝 更新日志

- **2025-06-18**: 初始版本，包含完整安装流程

---

> 💡 **提示**: 如果遇到问题，可以随时用 `claude` 启动 Claude Code，让它帮你解决问题！
