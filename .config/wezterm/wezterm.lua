local wezterm = require("wezterm")
local config = {}

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.font = wezterm.font("CaskaydiaCove Nerd Font Propo", { weight = "Regular" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 11
config.line_height = 1.1
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#CBE0F0" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#CBE0F0" },
}
config.window_padding = {
	left = 2,
	right = 0,
	top = 2,
	bottom = 0,
}
config.window_decorations = "NONE"
config.window_background_opacity = 0.9
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 1000

return config
