#!/bin/bash

CONFIG=$HOME/.config/rofi/

function menu() {
  chose=$(printf "󰐥 Poweroff\n󰑓 Reboot\n󰍃 Logout" | rofi -dmenu -i -1 3 -config $CONFIG/powermenu.rasi)
  case "$chose" in
    "󰐥 Poweroff") poweroff;;
    "󰑓 Reboot") reboot;;
    "󰍃 Logout") bspc quit;;
    *) exit 1;;
  esac
}

function launcher() {
  rofi -show drun -config $CONFIG/launcher.rasi
}

if [[ "$1" == "launcher" ]]; then
  launcher
elif [[ "$1" == "powermenu" ]]; then
  menu
fi
