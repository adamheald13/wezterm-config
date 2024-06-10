-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.adjust_window_size_when_changing_font_size = false
config.font_size = 16
config.keys = {
	-- Clears only the scrollback and leaves the viewport intact.
	-- You won't see a difference in what is on screen, you just won't
	-- be able to scroll back until you've output more stuff on screen.
	-- This is the default behavior.
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ClearScrollback("ScrollbackOnly"),
	},
	-- Clears the scrollback and viewport leaving the prompt line the new first line.
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
	-- Clears the scrollback and viewport, and then sends CTRL-L to ask the
	-- shell to redraw its prompt
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
