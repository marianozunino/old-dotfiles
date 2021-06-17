#!/bin/sh
########################
xrdb -merge ~/.Xresources
#compton &
lxsession &
dunst &
flameshot &
polybar --reload top &
setxkbmap -layout us -variant altgr-intl
#stop this shit..
setxkbmap -option caps:escape

i3-msg "workspace 2; exec --no-startup-id firefox"
sleep 1
i3-msg "workspace 3; exec --no-startup-id pcmanfm"
sleep 1
i3-msg "workspace 1"
#disable touchpad in thinky
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
nm-applet &
locker.sh &
