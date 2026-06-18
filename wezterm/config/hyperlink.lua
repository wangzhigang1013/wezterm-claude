local wezterm = require("wezterm")

local M = {}

function M.apply(config)
    -- 启用超链接规则
    config.hyperlink_rules = wezterm.default_hyperlink_rules()

    -- 添加自定义超链接规则

    -- 匹配 URL
    table.insert(config.hyperlink_rules, {
        regex = [[https?://[^\s<>"'`\)\]\}]+]],
        format = "$0",
    })

    -- 匹配邮箱
    table.insert(config.hyperlink_rules, {
        regex = [[\b\w+@\w+\.\w+\b]],
        format = "mailto:$0",
    })

    -- 匹配 Windows 路径（带盘符）
    table.insert(config.hyperlink_rules, {
        regex = [[([A-Za-z]:\\[^\s<>"'`\)\]\}]+)]],
        format = "file:///$1",
    })

    -- 匹配 Unix 路径
    table.insert(config.hyperlink_rules, {
        regex = [[(/[\w./\-]+)]],
        format = "file://$1",
    })

    -- 匹配包裹在 () 中的 URL
    table.insert(config.hyperlink_rules, {
        regex = [[\((https?://[^\s\)]+)\)]],
        format = "$1",
    })

    -- 匹配包裹在 [] 中的 URL
    table.insert(config.hyperlink_rules, {
        regex = [[\[(https?://[^\s\]]+)\]],
        format = "$1",
    })
end

return M
