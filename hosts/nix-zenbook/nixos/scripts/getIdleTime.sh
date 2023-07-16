#!/bin/sh
IDLE_STRING=`dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime | grep uint64`
echo $IDLE_STRING | awk '{print $2}'