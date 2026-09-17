#!usr/bin/bash

# This is the prefered extenal monitor state
activeExtMon="HDMI-A-1,1680x1050@75,0x0,1"
activeIntMon="eDP-1,highrr,auto,1"

inactiveExtMon="HDMI-A-1,disable"
inactiveIntMon="eDP-1,disable"

isExtMonitorConnected="$(hyprctl monitors | grep "HDMI-A-1")"

# Lid state true means that the lid is open
# which means the external monitor and the internal monitor
# both should work.
lidState=$(cat /proc/acpi/button/lid/LID0/state | "open")

if [ -n $lidState ]; then
    hyprctl keyword monitor $activeIntMon

    if [ -n $isExtMonitorConnected ]; then
        notify-send "Turning on dual monitor mode"
        hyprctl keyword monitor $activeExtMon
    fi
else
    # disabling 
    # turning the external monitor on
    hyprctl keyword monitor $inactiveIntMon 

    if [ -n $isExtMonitorConnected ]; then
        notify-send "Switching to External Monitor"
        hyprctl keyword monitor $activeExtMon 
        # Hibernation or suspend logic here.
        # TODO: add the hibernation logic.
    fi
fi
