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
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Neon"
-- config.color_scheme = "Mono (terminal.sexy)"
-- config.color_scheme = "Mono Theme (terminal.sexy)"
-- config.color_scheme = "Mono Cyan (Gogh)"
-- config.color_scheme = "Mono White (Gogh)"
-- config.color_scheme = "City Streets (terminal.sexy)"
-- config.color_scheme = "Dark Violet (base16)"
config.color_scheme = "Dracula (base16)"

config.colors = {
	background = "black",
}
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 12.5
config.line_height = 1.5

config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

config.scrollback_lines = 3000

config.window_background_opacity = 0.8
config.enable_scroll_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("ComicShannsMono Nerd Font", { weight = "Bold" })
config.font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Medium" })

-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- and finally, return the configuration to wezterm
return config
