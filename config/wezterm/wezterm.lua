local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("mononoki Nerd Font")
config.font_size = 18
config.line_height = 1.2 -- Increase vertical spacing between lines

-- Color scheme
config.color_scheme = "Everforest Dark (Gogh)"

-- Window
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Cursor
config.default_cursor_style = "BlinkingBar"

-- Keys
-- config.keys = {
-- 	-- Split panes
-- 	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- 	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- 	-- Navigate panes
-- 	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
-- 	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
-- 	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
-- 	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
-- 	-- Close pane
-- 	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
-- }

return config
