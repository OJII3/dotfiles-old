#!/bin/sh

export HOST_KB_ENABLED=true

# Function to check if an external keyboard is connected
check_external_keyboard() {
    hyprctl devices | grep -i "eucalyn-mint60"
}

# Function to disable the host keyboard

enable_keyboard() {
  hyprctl keyword '$LAPTOP_KB_ENABLED' "true" -r
  if ! HOST_KB_ENABLED; then
    HOST_KB_ENABLED=true
    notify-send -u low "Host Keyboard Enabled"
  fi
}

disable_keyboard() {
  hyprctl keyword '$LAPTOP_KB_ENABLED' "false" -r
  if HOST_KB_ENABLED; then
    HOST_KB_ENABLED=false
    notify-send -u low "Host Keyboard Disabled"
  fi
}

# Infinite loop to check for external keyboard and disable host keyboard

while true; do
  if check_external_keyboard; then
    disable_keyboard
  else
    enable_keyboard
  fi
  sleep 2
done

