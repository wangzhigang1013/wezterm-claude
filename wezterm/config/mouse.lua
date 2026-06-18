local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

function M.apply(config)
    -- 鼠标操作

    -- 选中文本自动复制到剪贴板
    config.selection_word_boundary = " \t\n{}[]()\"'`~=!@#$%^&*|\\;:,<>/?"

    -- 鼠标绑定
    config.mouse_bindings = {
        -- 右键粘贴
        {
            event = { Down = { streak = 1, button = "Right" } },
            mods = "NONE",
            action = action.PasteFrom("Clipboard"),
        },

        -- Ctrl + 点击打开链接
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = action.OpenLinkAtMouseCursor,
        },

        -- 中键粘贴
        {
            event = { Down = { streak = 1, button = "Middle" } },
            mods = "NONE",
            action = action.PasteFrom("PrimarySelection"),
        },
    }
end

return M
