local wezterm = require("wezterm")
local utils = require("config.utils")
local constants = require("config.constants")

local M = {}

function M.apply(config)
    -- 添加本地字体目录
    config.font_dirs = { utils.fonts_dir() }

    -- 内嵌字体路径
    local font_path = utils.join_path(utils.fonts_dir(), "MapleMono-NF-CN-Regular.ttf")

    if utils.file_exists(font_path) then
        config.font = wezterm.font_with_fallback({
            {
                family = "Maple Mono NF CN",
                weight = "Regular",
                harfbuzz_features = { "calt=1", "liga=1", "ss01=1", "ss02=1", "ss03=1", "ss04=1", "ss05=1", "ss06=1", "ss07=1", "ss08=1" },
            },
            {
                family = "Maple Mono NF CN",
                weight = "Bold",
                style = "Normal",
            },
            {
                family = "Maple Mono NF CN",
                weight = "Regular",
                style = "Italic",
            },
        })
    else
        config.font = wezterm.font_with_fallback({
            {
                family = "Cascadia Code",
                weight = "Regular",
                harfbuzz_features = { "calt=1", "liga=1" },
            },
            {
                family = "Consolas",
                weight = "Regular",
            },
        })
    end

    config.font_size = 13.5
    config.line_height = 1.15
    config.cell_width = 1.0
    config.freetype_load_flags = "NO_HINTING"
    config.freetype_load_target = "Normal"
    config.freetype_render_target = "Normal"
end

return M
