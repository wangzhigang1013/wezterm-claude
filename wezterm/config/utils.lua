local wezterm = require("wezterm")
local M = {}

-- 获取配置目录路径
function M.config_dir()
    return wezterm.home_dir .. "/.config/wezterm"
end

-- 获取字体目录路径
function M.fonts_dir()
    return M.config_dir() .. "/fonts"
end

-- 获取图片目录路径
function M.images_dir()
    return M.config_dir() .. "/images"
end

-- 检查文件是否存在
function M.file_exists(path)
    local f = io.open(path, "r")
    if f then
        f:close()
        return true
    end
    return false
end

-- 获取操作系统类型
function M.get_os()
    if wezterm.target_triple:find("windows") then
        return "windows"
    elseif wezterm.target_triple:find("apple") then
        return "macos"
    else
        return "linux"
    end
end

-- 拼接路径
function M.join_path(...)
    local separator = package.config:sub(1, 1) == "\\" and "\\" or "/"
    return table.concat({ ... }, separator)
end

return M
