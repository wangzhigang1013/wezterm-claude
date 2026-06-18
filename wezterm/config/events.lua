local wezterm = require("wezterm")
local constants = require("config.constants")

local M = {}

function M.apply(config)
    -- 启用状态栏
    config.enable_tab_bar = true
    config.tab_bar_at_bottom = false
    config.use_fancy_tab_bar = false
    config.status_update_interval = 1000

    -- 当前配色方案索引（用于切换）
    local current_scheme_index = 1

    -- 切换配色方案的事件处理
    wezterm.on("cycle-color-scheme", function(window, pane)
        current_scheme_index = current_scheme_index + 1
        if current_scheme_index > #constants.COLOR_SCHEMES then
            current_scheme_index = 1
        end

        local overrides = window:get_config_overrides() or {}
        overrides.color_scheme = constants.COLOR_SCHEMES[current_scheme_index]
        window:set_config_overrides(overrides)

        window:toast_notification(
            "WezTerm",
            "配色方案: " .. constants.COLOR_SCHEMES[current_scheme_index],
            nil,
            2000
        )
    end)

    -- 标签栏切换事件
    local tab_bar_visible = true

    wezterm.on("toggle-tab-bar", function(window, pane)
        tab_bar_visible = not tab_bar_visible
        local overrides = window:get_config_overrides() or {}
        overrides.enable_tab_bar = tab_bar_visible
        window:set_config_overrides(overrides)
    end)

    -- 状态栏：左侧显示当前进程和目录，右侧显示时间
    wezterm.on("update-status", function(window, pane)
        -- 左侧状态
        local cwd_uri = pane:get_current_working_dir()
        local cwd = ""
        if cwd_uri then
            cwd = cwd_uri.file_path or tostring(cwd_uri)
            -- 简化路径，只显示最后两级
            cwd = cwd:gsub("\\", "/")
            local parts = {}
            for part in cwd:gmatch("[^/]+") do
                table.insert(parts, part)
            end
            if #parts > 2 then
                cwd = ".../" .. parts[#parts - 1] .. "/" .. parts[#parts]
            end
        end

        local process = pane:get_foreground_process_name()
        local process_name = ""
        if process then
            process_name = string.match(process, "([^/\\]+)$") or process
        end

        -- 右侧状态：时间
        local time = wezterm.strftime("%H:%M")

        -- 设置状态栏颜色（Catppuccin 风格）
        window:set_left_status(wezterm.format({
            { Foreground = { Color = "#cba6f7" } },
            { Text = " " .. process_name .. " " },
            { Foreground = { Color = "#6c7086" } },
            { Text = cwd .. " " },
        }))

        window:set_right_status(wezterm.format({
            { Foreground = { Color = "#6c7086" } },
            { Text = " " .. time .. " " },
        }))
    end)
end

return M
