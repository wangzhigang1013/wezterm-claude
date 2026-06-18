local M = {}

-- 配色方案列表
M.COLOR_SCHEMES = {
    "Catppuccin Mocha",
    "Catppuccin Latte",
    "Tokyo Night",
    "Ayu Mirage",
    "One Dark (Gogh)",
    "Dracula",
    "Gruvbox Dark",
    "Nord",
    "Solarized Dark",
    "Rose Pine",
}

-- 默认配色方案
M.DEFAULT_COLOR_SCHEME = "Catppuccin Mocha"

-- Leader 键超时时间（毫秒）
M.LEADER_TIMEOUT = 1500

-- 字体大小
M.DEFAULT_FONT_SIZE = 13.0

-- 滚动缓冲区大小
M.SCROLLBACK_LINES = 20000

return M
