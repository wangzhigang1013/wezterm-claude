local wezterm = require("wezterm")

local M = {}

function M.apply(config)
    -- 启用标签栏
    config.enable_tab_bar = true

    -- 标签栏在顶部
    config.tab_bar_at_bottom = false

    -- 单个标签时也显示
    config.hide_tab_bar_if_only_one_tab = false

    -- 使用简洁标签栏
    config.use_fancy_tab_bar = false

    -- 标签最大宽度
    config.tab_max_width = 28

    -- 标签栏样式
    config.tab_bar_style = {
        new_tab = wezterm.format({
            { Background = { Color = "#11111b" } },
            { Foreground = { Color = "#6c7086" } },
            { Text = " + " },
        }),
        new_tab_hover = wezterm.format({
            { Background = { Color = "#181825" } },
            { Foreground = { Color = "#cba6f7" } },
            { Text = " + " },
        }),
    }
end

return M
