#!/usr/bin/env bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

handle() {
  case $1 in
    monitoradded*) 
      echo "monitor added";
        # hyprctl keyword monitor HDMI-A-1,2560x1440@100,0x1440,1
        # hyprctl keyword monitor eDP-1,disabled
      ;;
    monitorremoved*) 
        echo "monitor removed";
        # hyprctl keyword monitor HDMI-A-1,disabled
        # hyprctl keyword monitor eDP-1,preferred,auto,1
      ;;
  esac
}

socat -u UNIX-CONNECT:"$SOCKET" - | while read -r line; do
  handle "$line"
done
