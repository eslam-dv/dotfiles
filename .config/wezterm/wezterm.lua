local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	font = wezterm.font("JetBrainsMonoNL Nerd Font Propo", { weight = "Regular" }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 11,
	line_height = 1.1,
	color_scheme = "Catppuccin Mocha",
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
  enable_wayland = false,
}
