local wezterm = require("wezterm")

local M = {}

function M.apply(config)
    -- 自动重载配置
    config.automatically_reload_config = true

    -- 滚动缓冲区
    config.scrollback_lines = 20000

    -- 隐藏滚动条
    config.enable_scroll_bar = false

    -- 图形协议支持
    config.enable_kitty_graphics = true

    -- WebGpu 设置
    config.front_end = "WebGpu"
    config.webgpu_power_preference = "HighPerformance"

    -- 行为设置
    config.check_for_updates = false
    config.show_update_window = false

    -- ── 中文输入法支持 ──────────────────────────────────────
    -- 启用 IME（输入法编辑器）
    config.use_ime = true

    -- IME 预编辑渲染方式
    config.ime_preedit_rendering = "Builtin"


    -- ── 会话持久化 ──────────────────────────────────────────
    -- 关闭窗口时的行为：仅在 shell 干净退出时关闭
    config.exit_behavior = "CloseOnCleanExit"

    -- 默认工作区名称
    config.default_workspace = "main"
end

return M
