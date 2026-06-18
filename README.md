# WezTerm + Claude Code Windows 开发环境

> 🚀 Windows 下快速搭建 Claude Code 开发环境的一站式解决方案

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PowerShell 7](https://img.shields.io/badge/PowerShell-7-5391FE)](https://github.com/PowerShell/PowerShell)
[![WezTerm](https://img.shields.io/badge/WezTerm-Latest-4FC3F7)](https://wezfurlong.org/wezterm/)

## ✨ 特性

- 🎨 **高颜值终端** - Catppuccin Mocha 主题，88% 透明度
- ⚡ **一键安装** - 自动安装所有依赖和配置
- 🔧 **模块化配置** - 16 个独立配置模块，易于维护
- 🤖 **Claude 快捷命令** - `c`、`cc`、`cr` 快速启动
- 🌐 **跨平台** - 同一套配置支持 Windows/Linux/macOS
- 📝 **中文字体** - 内置 Maple Mono NF CN 字体

## 📦 包含组件

| 组件 | 版本 | 用途 |
|------|------|------|
| **WezTerm** | Latest | 高性能终端模拟器 |
| **PowerShell 7** | 7.4+ | 现代 Shell |
| **Claude Code** | Latest | AI 编程助手 |
| **ccswitch** | Latest | Claude Code 配置切换工具 |
| **Cascadia Code** | Windows 自带 | 编程字体 |
| **Catppuccin Mocha** | - | 终端配色方案 |

## 🌐 网络代理（必需）

> ⚠️ **重要**：由于网络限制，安装 Node.js、Claude Code 等工具时需要代理。请先配置好代理再进行安装。

### 推荐机场/代理服务

> 💡 如果你还没有代理服务，可以使用以下机场：

| 机场 | 链接 | 说明 |
|------|------|------|
| **推荐机场** | https://xn--ehqx35aimmzwv.com/ | 稳定高速，支持 Claude/GitHub |

注册后获取订阅链接，导入到 Clash Verge 即可使用。

### 免费节点资源（GitHub）

> ⚠️ **注意**：免费节点不稳定、速度慢，仅适合临时使用。长期使用建议购买付费机场。

| 项目 | 链接 | 说明 |
|------|------|------|
| **proxypool** | [GitHub](https://github.com/snakem982/proxypool) | 免费节点池，每日更新 |
| **free-node** | [GitHub](https://github.com/HakurouKen/free-node) | V2Ray 免费节点集合 |
| **Mirza** | [GitHub](https://github.com/resasanian/Mirza) | 每日更新免费节点 |
| **VPN-free** | [GitHub](https://github.com/SANYIMOE/VPN-free) | 免费 VPN 节点 |
| **Free** | [GitHub](https://github.com/halfaaa/Free) | 免费节点，每日更新 |

**使用方法：**

1. 点击上面的 GitHub 链接
2. 找到订阅链接（通常是 `.txt` 或 `.yaml` 文件）
3. 复制订阅链接
4. 在 Clash Verge 中添加订阅

**免费订阅链接汇总（直接复制到 Clash）：**

```
# 以下链接可能随时失效，建议定期更新
# 来源：GitHub 开源项目

https://raw.githubusercontent.com/snakem982/proxypool/main/proxies/sub.txt
https://raw.githubusercontent.com/HakurouKen/free-node/main/collect.txt
```

> 💡 将以上链接添加到 Clash Verge 的「订阅」中即可使用。

### 推荐代理工具：Clash Verge Rev

**下载地址：**

| 版本 | 链接 | 说明 |
|------|------|------|
| **Clash Verge Rev** | [GitHub Releases](https://github.com/clash-verge-rev/clash-verge-rev/releases) | 推荐，轻量高效 |
| **Clash for Windows** | [GitHub Releases](https://github.com/Fndroid/clash_for_windows_pkg/releases) | 经典版本（已停更） |
| **v2rayN** | [GitHub Releases](https://github.com/2dust/v2rayN/releases) | 备选方案 |

**安装步骤：**

1. 下载 `Clash.Verge_x.x.x_x64-setup.exe`（Windows 64位）
2. 安装并启动
3. 导入你的订阅链接或配置文件
4. 开启系统代理

**配置终端代理：**

```powershell
# 设置代理（端口根据你的 Clash 配置修改，通常是 7890）
$env:HTTP_PROXY = "http://127.0.0.1:7890"
$env:HTTPS_PROXY = "http://127.0.0.1:7890"

# 验证代理
curl https://www.google.com
```

**永久设置代理（添加到 PowerShell Profile）：**

```powershell
# 在 ~/. Documents/PowerShell/Microsoft.PowerShell_profile.ps1 中添加
$env:HTTP_PROXY = "http://127.0.0.1:7890"
$env:HTTPS_PROXY = "http://127.0.0.1:7890"
```

**npm 设置代理：**

```powershell
npm config set proxy http://127.0.0.1:7890
npm config set https-proxy http://127.0.0.1:7890
```

---

## 🚀 快速安装

### 前置条件

1. ✅ 安装并启动代理工具（Clash Verge 等）
2. ✅ 确认代理可用（能访问 Google/GitHub）

### 方法一：克隆仓库并运行安装脚本

```powershell
# 克隆仓库
git clone https://github.com/wangzhigang1013/wezterm-claude.git
cd wezterm-claude

# 以管理员身份运行安装脚本
.\scripts\install.ps1
```

### 方法二：手动安装

1. 下载本仓库的 ZIP 文件
2. 解压到任意目录
3. 以管理员身份运行 `scripts\install.ps1`

### 安装脚本参数

```powershell
# 跳过特定组件的安装
.\scripts\install.ps1 -SkipFont      # 跳过字体安装
.\scripts\install.ps1 -SkipNode      # 跳过 Node.js 安装
.\scripts\install.ps1 -SkipGit       # 跳过 Git 安装
.\scripts\install.ps1 -SkipWezTerm   # 跳过 WezTerm 安装
.\scripts\install.ps1 -SkipClaude    # 跳过 Claude Code 安装
```

## 📁 项目结构

```
wezterm-claude/
├── README.md                    # 本文件
├── LICENSE                      # MIT 许可证
├── SETUP-GUIDE.md              # 详细安装指南
├── wezterm/                    # WezTerm 配置
│   ├── wezterm.lua             # 入口文件
│   ├── config/                 # 配置模块
│   │   ├── appearance.lua      # 外观设置
│   │   ├── tab_bar.lua         # 标签栏
│   │   ├── cursor.lua          # 光标
│   │   ├── window.lua          # 窗口
│   │   ├── fonts.lua           # 字体
│   │   ├── shell.lua           # Shell
│   │   ├── keybindings.lua     # 快捷键
│   │   ├── mouse.lua           # 鼠标
│   │   ├── launch_menu.lua     # 启动菜单
│   │   ├── events.lua          # 事件
│   │   ├── advanced.lua        # 高级设置
│   │   ├── hyperlink.lua       # 超链接
│   │   ├── constants.lua       # 常量
│   │   └── utils.lua           # 工具函数
│   └── fonts/                  # 字体文件
├── powershell/                 # PowerShell 配置
│   └── Microsoft.PowerShell_profile.ps1
└── scripts/                    # 安装脚本
    ├── install.ps1             # 一键安装脚本
    └── test-install.ps1        # 环境测试脚本
```

## ⌨️ 快捷键

### WezTerm 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+T` | 新建标签页 |
| `Ctrl+W` | 关闭当前窗格 |
| `Ctrl+Shift+W` | 关闭整个标签页 |
| `Ctrl+Tab` | 下一个标签页 |
| `Ctrl+Alt+\` | 垂直分割 |
| `Ctrl+Alt+-` | 水平分割 |
| `Alt+方向键` | 切换窗格焦点 |
| `Ctrl+Shift+P` | 启动菜单 |
| `Ctrl+Shift+C` | 复制 |
| `Ctrl+Shift+V` | 粘贴 |
| `Ctrl+V` | 粘贴（支持图片） |
| `Ctrl+Shift+S` | 切换配色方案 |
| `F11` | 全屏切换 |

### Claude 快捷命令

| 命令 | 功能 |
|------|------|
| `c` | 启动 Claude（全自动） |
| `cc` | 继续上次会话（全自动） |
| `cr` | 选择会话恢复（全自动） |

### ccswitch 命令

ccswitch 是 Claude Code 配置切换工具，用于管理多个 API 配置。

| 命令 | 功能 |
|------|------|
| `ccswitch` | 启动交互式配置切换 |
| `ccswitch list` | 列出所有配置 |
| `ccswitch switch` | 切换到指定配置 |
| `ccswitch add` | 添加新配置 |
| `ccswitch remove` | 删除配置 |

### PowerShell 别名

| 命令 | 功能 |
|------|------|
| `g` | git |
| `v` | nvim |
| `ll` | 列出文件 |

## 🎨 配色方案

当前使用 **Catppuccin Mocha** 主题：

| 颜色 | 色值 | 用途 |
|------|------|------|
| 背景 | `#11111b` | 终端背景 |
| 高亮 | `#cba6f7` | 紫色高亮 |
| 文字 | `cdd6f4` | 主要文字 |
| 注释 | `#6c7086` | 次要文字 |

### 切换配色方案

按 `Ctrl+Shift+S` 可以在 10 种内置配色方案之间切换：

1. Catppuccin Mocha (默认)
2. Catppuccin Latte
3. Tokyo Night
4. Ayu Mirage
5. One Dark (Gogh)
6. Dracula
7. Gruvbox Dark
8. Nord
9. Solarized Dark
10. Rose Pine

## 🔧 自定义配置

### 修改字体

编辑 `wezterm/config/fonts.lua`：

```lua
config.font = wezterm.font("你的字体名称")
config.font_size = 14.0  -- 修改字体大小
```

### 修改配色

编辑 `wezterm/config/constants.lua`：

```lua
M.DEFAULT_COLOR_SCHEME = "Tokyo Night"  -- 修改默认配色
```

### 修改快捷键

编辑 `wezterm/config/keybindings.lua`，参考 [WezTerm 快捷键文档](https://wezfurlong.org/wezterm/config/keys.html)。

### 添加 Claude 命令

编辑 `powershell/Microsoft.PowerShell_profile.ps1`：

```powershell
function mycommand { claude --your-flags @args }
```

## 🐛 故障排除

### Claude Code 无法启动

```powershell
# 检查 Node.js
node --version

# 重新安装 Claude Code
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

### WezTerm 配置不生效

```powershell
# 检查配置文件
ls "$env:USERPROFILE\.config\wezterm\wezterm.lua"

# 重启 WezTerm 或按 Ctrl+Shift+R 重载
```

### 字体显示异常

1. 确认字体已安装到系统
2. 检查 `config/fonts.lua` 中的字体名称
3. 按 `Ctrl+Shift+S` 切换配色方案

### PowerShell Profile 不生效

```powershell
# 设置执行策略
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 重新加载
. $PROFILE
```

## 📝 更新日志

### v1.0.0 (2025-06-18)

- ✨ 初始版本发布
- 🎨 Catppuccin Mocha 主题
- ⚡ 一键安装脚本
- 🤖 Claude 快捷命令
- 📝 完整安装文档

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建你的分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- [WezTerm](https://wezfurlong.org/wezterm/) - 高性能终端模拟器
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - AI 编程助手
- [ccswitch](https://github.com/TomokiMatsubuchi/ccswitch) - Claude Code 配置切换工具
- [Catppuccin](https://catppuccin.com/) - 配色方案
- [Cascadia Code](https://github.com/microsoft/cascadia-code) - 编程字体
- [PowerShell](https://github.com/PowerShell/PowerShell) - 现代 Shell

## 📧 联系方式

- GitHub: [@wangzhigang1013](https://github.com/wangzhigang1013)
- Email: your-email@example.com

---

⭐ 如果这个项目对你有帮助，请给个 Star！
