-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"
config.initial_rows = 120
config.initial_cols = 280
config.font_size = 11.0
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Nerd Font Symbols",
	"HackGen Console NFJ",
	"Noto Color Emoji",
})
config.inactive_pane_hsb = {
	saturation = 0.8,
}
config.enable_scroll_bar = true
config.colors = {
	-- scrollbar_thumb = "#333333",
}

config.background = {
	{
		source = {
			File = "/home/ojii3/dotfiles/.config/wezterm/kafka_and_silver_wolf.jpg",
		},
		horizontal_align = "Center",
		repeat_x = "NoRepeat",
		opacity = 1,
		hsb = { brightness = 0.06 },
	},
}

config.tab_bar_style = {}

return config
