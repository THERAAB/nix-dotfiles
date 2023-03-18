#!/bin/sh
kantoSPDIF="alsa_output.pci-0000_19_00.6.iec958-stereo"
logitechHeadphones="alsa_output.usb-Logitech_G733_Gaming_Headset-00.iec958-stereo"

currentDefault="$(pactl get-default-sink)"

switch_audio() {
	if [ $currentDefault == $logitechHeadphones ]; then
	  pactl set-default-sink $kantoSPDIF
	  dunstify " Audio Switched to Kanto"
	else
	  pactl set-default-sink $logitechHeadphones
	  dunstify " Audio Switched to Logitech"
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
