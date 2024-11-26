local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.font = wezterm.font("CaskaydiaCove Nerd Font Propo", { weight = "Regular" })
config.font_size = 11
config.color_scheme = "catppuccin-mocha"
config.window_padding = {
  left = 2,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_decorations = "NONE"
config.window_background_opacity = 1
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.default_cursor_style = "SteadyBlock" --BlinkingBar

return config
