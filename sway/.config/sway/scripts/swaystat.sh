#!/bin/sh
common() {
  echo -n "{"
  echo -n "\"separator_block_width\":1,"
  echo -n "\"separator\": \"false\","
  echo -n "\"color\": \"$color\","
  echo -n "\"full_text\":\" $stat\","
  echo -n "},"
}

# Date and Time
mydate() {
  local color="#7aa2f7"
  local val=$(date "+%d-%m-%Y")
  local icon=""
  local stat=$icon\ $val
  common
}

mytime() {
  local color="#9ece6a"
  local val=$(date "+%I:%M %p")
  local icon="󰅐"
  local stat=$icon\ $val
  common
}

# Brightness
brightness() {
  local color="#e0af68"
  local val=$(brightnessctl -m intel_backlight g | awk -F, '{print $4}' | tr -d %)
  local icon=""
  local stat=$icon\ $val%
  common
}

# Battery
battery() {
  charge=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)
  local icon=""
  case $status in
  "Charging")  icon="󰂄";color="#7aa2f7"; ;;
  "Not charging") icon="󰠑" ;color="#f7768e" ;;
  "Unknown") icon="";color="#ff899d" ;;
  "Full") icon="⚡"; color="#e0af68" ;;
  esac 
  local stat=$icon\ $charge%
  common
}

# Audio
volume() {
  local color="#bb9af7"
  local val=$(pamixer --get-volume)
  muted=$(pamixer --get-mute)
  vol=" $val%"
  if [ $muted = 'true' ]; then
    vol=" "
    color="#f7768e"
  fi
  local stat=${vol}
  common
}

# Keyboard layout
language() {
  local color="#7dcfff"
  local val=$(swaymsg -r -t get_inputs | awk '/1:1:AT_Translated_Set_2_keyboard/;/xkb_active_layout_name/' | grep -A1 '\b1:1:AT_Translated_Set_2_keyboard\b' | grep "xkb_active_layout_name" | awk -F '"' '{print $4}')
  local icon=""
  local stat=$icon\ $val
  common
}


echo '{ "version": 1 , "click_events":false}'
echo '[[],'

while :
do
echo -n "["
language
volume
brightness
battery
mydate
mytime
echo -n "],"
sleep 1
done
