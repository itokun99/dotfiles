-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = "[ " .. wezterm.strftime("%a %b %-d %H:%M") .. " ]"

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "[ Power " .. string.format("%.0f%%", b.state_of_charge * 100) .. " ]"
	end

	-- local leader = ""
	-- if window:leader_is_active() then
	-- 	leader = "LEADER"
	-- end
	-- local dead = ""
	-- if window:dead_key_is_active() then
	-- 	dead = "DEAD"
	-- end
	-- window:set_right_status(leader .. " " .. dead)

	window:set_right_status(wezterm.format({
		{ Text = bat .. " - " .. date },
	}))
end)

-- -- This will hold the configuration.
local config = wezterm.config_builder()

config.leader = { key = "a", mods = "CTRL" }

--
-- -- This is where you actually apply your config choices
-- -- Spawn a fish shell in login mode
-- config.default_prog = { "/usr/bin/fish", "-l" }
-- config.default_prog = { "/usr/bin/bash", "fish -l" }
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
	tab_bar = {
		background = "none",

		active_tab = {
			-- The color of the background area for the tab
			bg_color = "none",
			-- The color of the text for the tab
			fg_color = "#ffffff",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},
		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "none",
			fg_color = "#606060",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "none",
			fg_color = "#ffffff",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},
	},
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.font_size = 12.5
config.line_height = 1.5

config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

config.scrollback_lines = 3000

-- config.window_background_opacity = 1
config.window_background_opacity = 0.85
config.enable_scroll_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("ComicShannsMono Nerd Font", { weight = "Bold" })
config.font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Medium" })

-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.keys = {
	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

-- and finally, return the configuration to wezterm
return config
