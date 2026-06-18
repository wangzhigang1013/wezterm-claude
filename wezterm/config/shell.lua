local wezterm = require("wezterm")
local utils = require("config.utils")

local M = {}

function M.apply(config)
    local os_type = utils.get_os()

    if os_type == "windows" then
        -- Windows 默认使用 PowerShell 7
        config.default_prog = { "C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.6.2.0_x64__8wekyb3d8bbwe\\pwsh.exe", "-NoLogo" }
    else
        -- Unix 系统优先使用 Zsh，没有则回退到 Bash
        if utils.file_exists("/bin/zsh") then
            config.default_prog = { "/bin/zsh" }
        elseif utils.file_exists("/usr/bin/zsh") then
            config.default_prog = { "/usr/bin/zsh" }
        else
            config.default_prog = { "/bin/bash" }
        end
    end
end

return M
