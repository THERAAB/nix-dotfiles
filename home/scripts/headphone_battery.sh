#!/bin/sh
percentage=$(headsetcontrol -b -c)
headPhoneIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-headset-symbolic.symbolic.png"

notify-send -i "$headPhoneIcon" "$percentage% battery remaining"