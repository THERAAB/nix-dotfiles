#!/bin/sh
let "div = 1000"
let "limit = 10"
echo 1 > /tmp/backlight
dimmed=false
cmd=/sys/class/leds/asus::kbd_backlight/brightness

while true
do
  sleep 1
  idle_string=`dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime | grep uint64`
  idle=`echo $idle_string | awk '{print $2}'`
  if [ $(($idle / $div)) -gt $limit ] && [ $dimmed == false ]; then
    echo 0 > /tmp/backlight
    dimmed=true
  elif [ $(($idle / $div)) -le $limit ] && [ $dimmed == true ]; then
    echo 1 > /tmp/backlight
    dimmed=false
  fi
done
