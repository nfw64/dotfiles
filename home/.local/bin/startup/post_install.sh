#!/bin/bash

if [[ ! $(which awww) ]]; then
    notify-send 'Error: awww is not installed!' "Please install it with your package manager" \
        --icon="dialog-error" --app-name=$0

    exit 1
fi

notify-send "Generating thumbnails for wallpapers" "Please wait..." \
    --icon="preferences-desktop-wallpaper" --app-name=$0

python3 $SCRIPTS/auto_walls rofi --gen-thumbnails

notify-send "Thumbnails were generated!" \
    --icon="preferences-desktop-wallpaper" --app-name=$0

