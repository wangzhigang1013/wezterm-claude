local wezterm = require("wezterm")
local act = wezterm.action
local constants = require("config.constants")
local M = {}

function M.apply(config)
    -- 不再使用 Leader 键
    config.leader = nil

    config.keys = {
        -- ── 窗口管理 ──────────────────────────────────────────
        { key = "F11",        mods = "NONE",       action = act.ToggleFullScreen },
        { key = "m",          mods = "CTRL|ALT",   action = act.HideApplication },

        -- ── 标签页 ────────────────────────────────────────────
        { key = "t",          mods = "CTRL",        action = act.SpawnTab("CurrentPaneDomain") },
        { key = "w",          mods = "CTRL",         action = act.CloseCurrentPane({ confirm = false }) },
        { key = "Tab",        mods = "CTRL",         action = act.ActivateTabRelative(1) },
        { key = "Tab",        mods = "CTRL|SHIFT",   action = act.ActivateTabRelative(-1) },
        { key = "PageUp",     mods = "CTRL",         action = act.ScrollByPage(-1) },
        { key = "PageDown",   mods = "CTRL",         action = act.ScrollByPage(1) },

        -- ── 窗格分割 ──────────────────────────────────────────
        { key = "\\",         mods = "CTRL|ALT",    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = "-",          mods = "CTRL|ALT",    action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "w",          mods = "CTRL|SHIFT",  action = act.CloseCurrentTab({ confirm = false }) },

        -- 窗格焦点切换（Alt + 方向键）
        { key = "LeftArrow",  mods = "ALT",         action = act.ActivatePaneDirection("Left") },
        { key = "RightArrow", mods = "ALT",         action = act.ActivatePaneDirection("Right") },
        { key = "UpArrow",    mods = "ALT",         action = act.ActivatePaneDirection("Up") },
        { key = "DownArrow",  mods = "ALT",         action = act.ActivatePaneDirection("Down") },

        -- 窗格大小调整（Ctrl+Shift + 方向键）
        { key = "LeftArrow",  mods = "CTRL|SHIFT",  action = act.AdjustPaneSize({ "Left", 3 }) },
        { key = "RightArrow", mods = "CTRL|SHIFT",  action = act.AdjustPaneSize({ "Right", 3 }) },
        { key = "UpArrow",    mods = "CTRL|SHIFT",  action = act.AdjustPaneSize({ "Up", 3 }) },
        { key = "DownArrow",  mods = "CTRL|SHIFT",  action = act.AdjustPaneSize({ "Down", 3 }) },

        -- ── 标签页重命名 ──────────────────────────────────────
        { key = "r",          mods = "CTRL|SHIFT",  action = act.PromptInputLine({
            description = "输入标签页新名称（留空恢复默认）",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }) },

        -- ── 搜索与命令 ────────────────────────────────────────
        { key = "f",          mods = "CTRL|SHIFT",  action = act.Search({ CaseInSensitiveString = "" }) },
        { key = "p",          mods = "CTRL|SHIFT",  action = act.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS" }) },
        { key = "Space",      mods = "CTRL|SHIFT",  action = act.ActivateCommandPalette },
        { key = "k",          mods = "CTRL|SHIFT",  action = act.ClearScrollback("ScrollbackAndViewport") },
        { key = "x",          mods = "CTRL|SHIFT",  action = act.ActivateCopyMode },

        -- 滚动
        { key = "Home",       mods = "CTRL",        action = act.ScrollToTop },
        { key = "End",        mods = "CTRL",        action = act.ScrollToBottom },


        -- ── 复制粘贴 ──────────────────────────────────────────
        { key = "c",          mods = "CTRL|SHIFT",  action = act.CopyTo("Clipboard") },
        { key = "v",          mods = "CTRL|SHIFT",  action = act.PasteFrom("Clipboard") },
        { key = "v",          mods = "CTRL",        action = act.PasteFrom("Clipboard") },

        -- ── 配色方案切换 ──────────────────────────────────────
        { key = "s",          mods = "CTRL|SHIFT",  action = act.InputSelector({
            title = "选择配色方案",
            choices = (function()
                local choices = {}
                for _, scheme in ipairs(constants.COLOR_SCHEMES) do
                    table.insert(choices, { label = scheme })
                end
                return choices
            end)(),
            action = wezterm.action_callback(function(window, _, id, label)
                if label then
                    window:set_config_overrides({ color_scheme = label })
                end
            end),
        }) },
    }
end

return M
