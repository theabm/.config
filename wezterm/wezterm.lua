-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- How to find default colors?
-- local my_default = wezterm.color.get_default_colors()

-- Font configuration
config.font_size = 20
config.font = wezterm.font 'Hack Nerd Font'

-- Bar behavior and appearance
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = true

config.audible_bell = "Disabled"


return config
