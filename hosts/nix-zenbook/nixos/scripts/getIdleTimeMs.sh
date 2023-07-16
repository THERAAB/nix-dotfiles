#!/bin/sh

let "div = 1000"
let "limit = $1"
dimmed=false
cmd=/sys/class/leds/asus::kbd_backlight/brightness

echo hello

while true
do
  sleep 5
  echo checking idle
  idle_string=`dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime | grep uint64`
  idle=`echo $idle_string | awk '{print $2}'`
  echo $idle
  if [ $(($idle / $div)) -gt $limit ] && [ $dimmed == false ]; then
    echo dimming
    sudo echo 0 | tee $cmd 
    dimmed=true
  elif [ $(($idle / $div)) -le $limit ] && [ $dimmed == true ]; then
    echo undimming
    sudo echo 3 | tee $cmd 
    dimmed=false
  fi
done
