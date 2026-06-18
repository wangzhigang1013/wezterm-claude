local wezterm = require("wezterm")

local M = {}

function M.apply(config)
    -- 窗口关闭不确认
    config.window_close_confirmation = "NeverPrompt"

    -- 输入时隐藏鼠标
    config.hide_mouse_cursor_when_typing = true

    -- 禁止调整窗口大小时改变字体
    config.adjust_window_size_when_changing_font_size = false

    -- 粗体增强颜色
    config.bold_brightens_ansi_colors = "BrightAndBold"

    -- 静音
    config.audible_bell = "Disabled"

    -- 标题栏样式（Catppuccin 风格）
    config.window_frame = {
        font = wezterm.font("Cascadia Code", { weight = "Bold" }),
        font_size = 9.0,
        active_titlebar_bg = "#11111b",
        inactive_titlebar_bg = "#11111b",
        active_titlebar_fg = "#cdd6f4",
        inactive_titlebar_fg = "#6c7086",
        inactive_titlebar_border_bottom = "#11111b",
        active_titlebar_border_bottom = "#cba6f7",
    }
end

return M
