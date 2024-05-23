#!/bin/sh

export STATUS_FILE="$XDG_RUNTIME_DIR/keyboard.status"


enable_keyboard() {
    printf "true" >"$STATUS_FILE"
    hyprctl keyword '$LAPTOP_KB_ENABLED' "true" -r &&
    notify-send -u normal "Touchpad Enabled"
}

disable_keyboard() {
    printf "false" >"$STATUS_FILE"
    hyprctl keyword '$LAPTOP_KB_ENABLED' "false" -r &&
    notify-send -u normal "Touchpad Disabled"
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_keyboard
else
  if [ "$(cat "$STATUS_FILE")" = "true" ]; then
    disable_keyboard
  elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
    enable_keyboard
  fi
fi
