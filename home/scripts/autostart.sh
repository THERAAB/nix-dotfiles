#!/bin/sh
maestral start &
/home/raab/.config/scripts/headphone_lights.sh &
/home/raab/.config/scripts/restart_openrazer_loop.sh &
steam -silent &
