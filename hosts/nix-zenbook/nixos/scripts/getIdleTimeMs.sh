#!/bin/sh
let "div = 1000"
let "limit = 60"
dimmed=false
cmd=/sys/class/leds/asus::kbd_backlight/brightness

while true
do
  sleep 1
  idle_string=`dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime | grep uint64`
  idle=`echo $idle_string | awk '{print $2}'`
  if [ $(($idle / $div)) -gt $limit ] && [ $dimmed == false ]; then
    sudo echo 0 | tee $cmd 
    dimmed=true
  elif [ $(($idle / $div)) -le $limit ] && [ $dimmed == true ]; then
    sudo echo 1 | tee $cmd 
    dimmed=false
  fi
done
