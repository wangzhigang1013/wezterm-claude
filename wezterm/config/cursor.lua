local M = {}

function M.apply(config)
    -- 光标样式：Bar（竖线）
    config.default_cursor_style = "BlinkingBar"

    -- 光标闪烁：平滑慢闪
    config.cursor_blink_rate = 500
    config.cursor_blink_ease_in = "EaseOut"
    config.cursor_blink_ease_out = "EaseIn"

    -- 光标颜色：跟随主题
    config.force_reverse_video_cursor = false

    -- 光标厚度：纤细精致
    config.cursor_thickness = 2
end

return M
