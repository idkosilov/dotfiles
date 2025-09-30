local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 16
config.color_scheme = "Gruvbox dark, hard (base16)"
config.enable_tab_bar = false
config.window_padding = { left = 20, right = 20, top = 20, bottom = 10 }
config.audible_bell = "Disabled"

return config
