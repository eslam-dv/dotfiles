local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	font = wezterm.font("CaskaydiaCove Nerd Font Propo", { weight = "Regular" }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 11,
	line_height = 1.1,
	-- colors = {
	-- 	foreground = "#CBE0F0",
	-- 	background = "#011423",
	-- 	cursor_bg = "#47FF9C",
	-- 	cursor_border = "#47FF9C",
	-- 	cursor_fg = "#011423",
	-- 	selection_bg = "#033259",
	-- 	selection_fg = "#CBE0F0",
	-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#CBE0F0" },
	-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#CBE0F0" },
	-- }
	colors = {
		foreground = "#EBDBB2",
		background = "#171a1a",
		selection_bg = "#32302f",
		selection_fg = "#EBDBB2",
		ansi = { "#0d0e0f", "#fb4934", "#8ec07c", "#fabd2f", "#458588", "#b16286", "#7fa2ac", "#EBDBB2" },
		brights = { "#0d0e0f", "#fb4934", "#8ec07c", "#fabd2f", "#458588", "#b16286", "#7fa2ac", "#EBDBB2" },
	},
	window_padding = {
		left = 4,
		right = 0,
		top = 2,
		bottom = 0,
	},
	window_decorations = "NONE",
	window_background_opacity = 1,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	force_reverse_video_cursor = true,
	default_cursor_style = "SteadyBlock",
}
