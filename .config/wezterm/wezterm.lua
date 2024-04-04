-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- Spawn a fish shell in login mode
config.default_prog = { "/usr/local/bin/fish", "-l" }

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "Dracula"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 14
config.line_height = 1.0

config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })

-- and finally, return the configuration to wezterm
return config
