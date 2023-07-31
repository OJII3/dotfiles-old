-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("update-right-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = query_appearance_gnome()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

config.color_scheme = "iceberg"
config.initial_rows = 120
config.initial_cols = 200
config.font_size = 13.0
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Nerd Font Symbols",
	"HackGen Console NFJ",
	"Noto Color Emoji",
})
config.inactive_pane_hsb = {
	saturation = 0.8,
}
config.background = {
	{
		source = {
			-- File = '/usr/share/backgrounds/archlinux/archwave.png'
			File = "/home/ojii3/Pictures/haxxor-bunny.png",
		},
		horizontal_align = "Center",
		hsb = { brightness = 0.15 },
	},
}
-- config.window_background_gradient = {
--   colors = { 'deeppink', 'gold' },
--   orientation = {
--     Radial = {
--       cs = 0.75,
--       cy = 0.75,
--       radius = 1.25,
--     }
--   }
-- }

-- and finally, return the configuration to wezterm
return config
