local wezterm = require("wezterm")
local utils = require("config.utils")

local M = {}

-- 背景图片配置选项
local options = {
    enabled = false,           -- 是否启用背景图片
    random = false,            -- 是否随机切换
    fixed_image = "03.jpg",   -- 固定图片（random=false 时生效）
    interval_minutes = 5,      -- 随机切换间隔（分钟）
    image_hsb = {
        brightness = 0.08,     -- 亮度调低，不影响文字阅读
    },
}

function M.apply(config)
    if not options.enabled then
        return
    end

    local images_dir = utils.images_dir()
    local image_path = utils.join_path(images_dir, options.fixed_image)

    if utils.file_exists(image_path) then
        config.background = {
            {
                source = {
                    File = image_path,
                },
                repeat_x = "NoRepeat",
                repeat_y = "NoRepeat",
                width = "Cover",
                height = "Cover",
                horizontal_align = "Center",
                vertical_align = "Middle",
                hsb = options.image_hsb,
            },
        }
    end
end

return M
