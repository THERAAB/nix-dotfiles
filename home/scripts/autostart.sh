#!/bin/sh
maestral start &
~/.config/scripts/headphone_lights.sh &
~/.config/scripts/restart_openrazer_loop.sh &
steam -silent &
ulauncher --hide-window &