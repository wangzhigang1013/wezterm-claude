local wezterm = require("wezterm")
local utils = require("config.utils")

local M = {}

function M.apply(config)
    local shell = "C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.6.2.0_x64__8wekyb3d8bbwe\\pwsh.exe"

    config.launch_menu = {
        -- 新建会话
        { label = "Claude",                      args = { shell, "-NoLogo", "-NoExit", "-Command", "claude" },                      domain = "CurrentPaneDomain" },
        { label = "Claude (Auto)",               args = { shell, "-NoLogo", "-NoExit", "-Command", "claude --dangerously-skip-permissions" }, domain = "CurrentPaneDomain" },

        -- 继续上次会话（直接继续最近一个）
        { label = "Claude (Continue)",           args = { shell, "-NoLogo", "-NoExit", "-Command", "claude --continue" },           domain = "CurrentPaneDomain" },
        { label = "Claude (Continue Auto)",      args = { shell, "-NoLogo", "-NoExit", "-Command", "claude --continue --dangerously-skip-permissions" }, domain = "CurrentPaneDomain" },

        -- 选择会话恢复（列出所有历史会话供选择）
        { label = "Claude (Resume)",             args = { shell, "-NoLogo", "-NoExit", "-Command", "claude --resume" },             domain = "CurrentPaneDomain" },
        { label = "Claude (Resume Auto)",        args = { shell, "-NoLogo", "-NoExit", "-Command", "claude --resume --dangerously-skip-permissions" }, domain = "CurrentPaneDomain" },
    }
end

return M
