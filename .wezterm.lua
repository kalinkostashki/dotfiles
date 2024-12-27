-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Bamboo"

-- Font Config
config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Leader key configuration
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Tab Switching and splitting
config.keys = {
	{ key = "LeftArrow", mods = "SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SHIFT", action = wezterm.action.ActivateTabRelative(1) },
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

-- Miscelianeous settings
config.max_fps = 120
config.prefer_egl = true

-- Background images
local M = {}

M.vivid_blurred = os.getenv("HOME") .. "/dotfiles/assets/bg-blurred.jpg"
config.window_background_image = M.vivid_blurred

-- and finally, return the configuration to wezterm
return config
