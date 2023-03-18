#!/bin/sh
maestral start &
~/.config/qtile/scripts/headphone_lights.sh &
~/.config/qtile/scripts/restart_openrazer_loop.sh &
steam -silent &
