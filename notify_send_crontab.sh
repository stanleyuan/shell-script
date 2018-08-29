#!/bin/bash

eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";
# eval "export | egrep 'DBUS_SESSION_BUS_ADDRESS|DISPLAY'"

# DISPLAY=:0 notify-send "Test"
notify-send "Take a rest"
