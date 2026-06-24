local wezterm = require("wezterm")
local config = wezterm.config_builder()

local modules = {
    "config.fonts",
    "config.appearance",
    "config.window",
    "config.tab_bar",
    "config.cursor",
    "config.shell",
    "config.ssh_domains",
    "config.launch_menu",
    "config.events",
    "config.keybindings",
    "config.mouse",
    "config.advanced",
    "config.hyperlink",
}

for _, name in ipairs(modules) do
    local ok, module = pcall(require, name)
    if ok and module and module.apply then
        module.apply(config)
    end
end

-- ── tabline.wez 插件（本地安装）─────────────────────────
local tabline = wezterm.plugin.require("C:/Users/17343/.config/wezterm/plugins/tabline.wez")

tabline.setup({
    options = {
        icons_enabled = true,
        theme = 'Catppuccin Mocha',
        theme_overrides = {},
        section_separators = {
            left = wezterm.nerdfonts.pl_left_hard_divider,
            right = wezterm.nerdfonts.pl_right_hard_divider,
        },
        component_separators = {
            left = wezterm.nerdfonts.pl_left_soft_divider,
            right = wezterm.nerdfonts.pl_right_soft_divider,
        },
        tab_separators = {
            left = wezterm.nerdfonts.pl_left_hard_divider,
            right = wezterm.nerdfonts.pl_right_hard_divider,
        },
    },
    sections = {
        tabline_a = { 'mode' },
        tabline_b = { 'workspace' },
        tabline_c = { ' ' },
        tab_active = {
            'index',
            { 'parent', padding = 0 },
            '/',
            { 'cwd', padding = { left = 0, right = 1 } },
            { 'zoomed', padding = 0 },
        },
        tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
        tabline_x = { 'ram', 'cpu' },
        tabline_y = { 'datetime', 'battery' },
        tabline_z = { 'domain' },
    },
})

tabline.apply_to_config(config)

return config
