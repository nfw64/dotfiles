#!/bin/bash

# Define the theme file and the color import
# Replace 'launcher.rasi' with the actual name of that file you showed me
THEME_FILE="~/.config/rofi/themes/launcher.rasi"
THEME_STR='@import "~/.config/rofi/themes/colors/colors.rasi"'

# Define the Main Menu options
main_options="󰍜 Monitor system\n󰏘 Theme settings\n󱑠 Refresh rate\n󰒲 Inhibit\n󰠠 Powersafe mode\n Reload config"

# We pass BOTH the -theme (for layout) and -theme-str (for Matugen colors)
chosen=$(echo -e "$main_options" | rofi -dmenu -i -p "System Menu" -theme "$THEME_FILE" -theme-str "$THEME_STR")

case "$chosen" in
*Monitor*)
    sub=$(echo -e "htop\nnvtop\npowertop\nmissioncenter" | rofi -dmenu -i -p "Monitor" -theme "$THEME_FILE" -theme-str "$THEME_STR")
    case "$sub" in
    htop) kitty htop ;;
    nvtop) kitty nvtop ;;
    powertop) kitty sudo powertop ;;
    missioncenter) missioncenter ;;
    esac
    ;;
*Theme*)
    sub=$(echo -e "GTK settings\nQT6 settings\nKvantum settings" | rofi -dmenu -i -p "Themes" -theme "$THEME_FILE" -theme-str "$THEME_STR")
    case "$sub" in
    "GTK settings") nwg-look ;;
    "QT6 settings") qt6ct ;;
    "Kvantum settings") kvantummanager ;;
    esac
    ;;
*Reload*)
    hyprctl reload && pkill waybar && waybar &
    ;;
esac
