local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font Propo", weight = "Regular" })
config.force_reverse_video_cursor = true
config.tab_bar_at_bottom = true
config.window_background_opacity = 1
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
config.colors = {
	background = "#000000",
	foreground = "#abb2bf",
	cursor_bg = "#8fc6f4",
	cursor_fg = "#000000",
	selection_bg = "#8fc6f4",
	selection_fg = "#000000",
	ansi = {
		"#000000",
		"#ef596f",
		"#89ca78",
		"#e5c07b",
		"#61afef",
		"#d55fde",
		"#2bbac5",
		"#abb2bf",
	},
	brights = {
		"#434852",
		"#f38897",
		"#a9d89d",
		"#edd4a6",
		"#8fc6f4",
		"#e089e7",
		"#4bced8",
		"#c8cdd5",
	},
	tab_bar = {
		inactive_tab_edge = "#000000",
		background = "#000000",
		active_tab = {
			fg_color = "#000000",
			bg_color = "#8fc6f4",
			intensity = "Bold",
		},
		inactive_tab = {
			fg_color = "#434852",
			bg_color = "#000000",
			intensity = "Bold",
		},
		inactive_tab_hover = {
			fg_color = "#8fc6f4",
			bg_color = "#000000",
		},
		new_tab = {
			fg_color = "#8fc6f4",
			bg_color = "#000000",
		},
		new_tab_hover = {
			fg_color = "#000000",
			bg_color = "#8fc6f4",
		},
	},
	indexed = {
		[59] = "#434852",
		[100] = "#e2be7d",
		[214] = "#d19a66",
	},
}

-- Keybindings
config.keys = {}
-- Pane management
for _, v in ipairs({
	{ "Enter", act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ "w", act.CloseCurrentPane({ confirm = true }) },
	{ "h", act.ActivatePaneDirection("Left") },
	{ "l", act.ActivatePaneDirection("Right") },
  { "LeftArrow", act.ActivatePaneDirection("Left") },
	{ "RightArrow", act.ActivatePaneDirection("Right") },
	{ "UpArrow", act.ActivatePaneDirection("Up") },
	{ "DownArrow", act.ActivatePaneDirection("Down") },
	{ "m", act.TogglePaneZoomState },
	{ "t", act.SpawnTab("CurrentPaneDomain") },
	{ "q", act.CloseCurrentTab({ confirm = true }) },
	{ "c", act.CopyTo("ClipboardAndPrimarySelection") },
	{ "v", act.PasteFrom("Clipboard") },
	{ "=", act.IncreaseFontSize },
	{ "-", act.DecreaseFontSize },
	{ "0", act.ResetFontSize },
}) do
	table.insert(config.keys, { mods = "ALT", key = v[1], action = v[2] })
end

-- ALT+SHIFT combinations
table.insert(
	config.keys,
	{ mods = "ALT|SHIFT", key = "Enter", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }
)

-- Tab navigation (ALT+1-8)
for i = 0, 7 do
	table.insert(config.keys, { mods = "ALT", key = tostring(i + 1), action = act.ActivateTab(i) })
end

-- Tab movement and last tab (CTRL+ALT)
for _, v in ipairs({
	{ "UpArrow", act.ActivateLastTab },
	{ "DownArrow", act.ActivateLastTab },
	{ "LeftArrow", act.MoveTabRelative(-1) },
	{ "RightArrow", act.MoveTabRelative(1) },
}) do
	table.insert(config.keys, { mods = "CTRL|ALT", key = v[1], action = v[2] })
end
for i = 0, 7 do
	table.insert(config.keys, { mods = "CTRL|ALT", key = tostring(i + 1), action = act.MoveTab(i) })
end

return config
