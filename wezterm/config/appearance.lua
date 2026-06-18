local M = {}

function M.apply(config)
    -- ── 配色方案：Catppuccin Mocha ──────────────────────────
    config.color_scheme = "Catppuccin Mocha"

    -- ── 透明度与模糊 ──────────────────────────────────────────
    config.window_background_opacity = 0.88

    -- ── 窗口装饰：无边框 + 集成按钮 ──────────────────────────
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

    -- ── 内边距：宽松舒适 ──────────────────────────────────────
    config.window_padding = {
        left = 20,
        right = 20,
        top = 16,
        bottom = 16,
    }

    -- ── 默认窗口大小 ──────────────────────────────────────────
    config.initial_rows = 32
    config.initial_cols = 120

    -- ── WebGpu 高性能渲染 ──────────────────────────────────────
    config.front_end = "WebGpu"
    config.webgpu_power_preference = "HighPerformance"

    -- ── 关闭毛玻璃避免卡顿 ──────────────────────────────────────
    config.win32_system_backdrop = "Disable"

    -- ── 标签栏配色（Catppuccin 风格）────────────────────────────
    config.colors = {
        tab_bar = {
            background = "#11111b",
            active_tab = {
                bg_color = "#cba6f7",
                fg_color = "#11111b",
                intensity = "Bold",
            },
            inactive_tab = {
                bg_color = "#11111b",
                fg_color = "#6c7086",
            },
            inactive_tab_hover = {
                bg_color = "#181825",
                fg_color = "#cdd6f4",
            },
            new_tab = {
                bg_color = "#11111b",
                fg_color = "#6c7086",
            },
            new_tab_hover = {
                bg_color = "#181825",
                fg_color = "#cba6f7",
            },
        },
    }
end

return M
