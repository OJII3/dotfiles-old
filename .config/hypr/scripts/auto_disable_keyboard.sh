#!/bin/sh

HOST_KB_ENABLED=1

# Function to check if an external keyboard is connected
check_external_keyboard() {
    hyprctl devices | grep -i "eucalyn-mint60"
}

# Function to disable the host keyboard

enable_keyboard() {
  if [ "$HOST_KB_ENABLED" -eq 0 ]; then
    hyprctl keyword '$LAPTOP_KB_ENABLED' "true" -r
    notify-send -u low "Host Keyboard Enabled"
  fi

  HOST_KB_ENABLED=1
}

disable_keyboard() {
  if [ "$HOST_KB_ENABLED" -eq 1 ]; then
    hyprctl keyword '$LAPTOP_KB_ENABLED' "false" -r
    notify-send -u low "Host Keyboard Disabled"
  fi

  HOST_KB_ENABLED=0
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
