-- Pull in the wezterm API
local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "🔋 " .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format({
		{ Text = bat .. "   " .. date },
	}))
end)

-- -- This will hold the configuration.
local config = wezterm.config_builder()
--
-- -- This is where you actually apply your config choices
-- -- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
--
-- -- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "black",
}
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.window_decorations = "RESIZE | TITLE"
config.font_size = 10
config.line_height = 1.0

config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

config.scrollback_lines = 3500

config.window_background_opacity = 1
config.enable_scroll_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })

-- and finally, return the configuration to wezterm
return config