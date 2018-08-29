#!/bin/bash

eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";
# eval "export | egrep 'DBUS_SESSION_BUS_ADDRESS|DISPLAY'"

# DISPLAY=:0 notify-send "Test"
nohup at now + ${1} min <<< 'notify-send "Take a Rest"' >>  /dev/null 2>&1 &
