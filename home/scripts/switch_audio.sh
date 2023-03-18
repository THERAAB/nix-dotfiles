#!/bin/sh
kantoSPDIF="alsa_output.pci-0000_1b_00.6.iec958-stereo"
logitechHeadphones="alsa_output.usb-Logitech_G733_Gaming_Headset-00.iec958-stereo"

headPhoneIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-headset-symbolic.symbolic.png"
kantoIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic.symbolic.png"

currentDefault="$(pactl get-default-sink)"

switch_audio() {
	if [ $currentDefault == $logitechHeadphones ]; then
	  pactl set-default-sink $kantoSPDIF
	  notify-send -i $kantoIcon "Audio Switched to Kanto"
	else
	  pactl set-default-sink $logitechHeadphones
	  notify-send -i $headPhoneIcon "Audio Switched to Logitech"
	fi
}

get_icon() {
	if [ $currentDefault == $logitechHeadphones ]; then
		echo ""
	else
		echo "蓼"	
	fi
}

case "$1" in
    switch)
        switch_audio;;
    icon)
        get_icon;;
esac
