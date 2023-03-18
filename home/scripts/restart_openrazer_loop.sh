#!/bin/sh

while true; do 
	sleep 600;
	systemctl --user restart openrazer-daemon.service 
done
