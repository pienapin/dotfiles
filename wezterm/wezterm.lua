-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'default'

config.color_schemes = {
	['default'] = {
		background = "#121212",
		foreground = "#d3c6aa",
		ansi = {
			"#191919",
			"#a63a3a",
			"#688c7d",
			"#ffb365",
			"#68778c",
			"#fdb3b2",
			"#86abd9",
			"#d3c6aa",
		},
		brights = {
			"#86817e",
			"#d75756",
			"#688c7d",
			"#ffb365",	
			"#68778c",
			"#8c686a",
			"#86abd9",
			"#f7f8f2",
		},
	},
}

config.window_background_opacity = 0.75

config.window_frame = {
	font = wezterm.font 'scienerdtifica',
	font_size = 12.0,
	active_titlebar_bg = '#333333'
}

config.window_padding = {
  left = 12,
  right = 12,
  top = 0,
  bottom = 0,
}

config.font = wezterm.font 'scienerdtifica'
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
