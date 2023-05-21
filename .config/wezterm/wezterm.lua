-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Builtin Solarized Light'
  end
end

wezterm.on('update-right-status', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = query_appearance_gnome()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
config.initial_rows = 120
config.initial_cols = 200
config.window_background_gradient = {
  colors = { '#103000', '#0F295C', '#000000' },
  orientation = { Linear = { angle = -45 } }
}
config.background = {
  {
    source = {
      -- Gradient = { preset = 'Warm' },
      Color = '#000000',
    },
    opacity = 1,
  },
  {
    source = {
      File = '/usr/local/src/pictures/mikuv3_img2.png'
    },
    repeat_x = 'NoRepeat',
    vertical_align = 'Middle',
    attachment = 'Fixed',
    hsb = { brightness = 0.5 },
    opacity = 0.8,
  },
}

-- and finally, return the configuration to wezterm
return config
