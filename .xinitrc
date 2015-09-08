#! /bin/bash
export PANEL_HEIGHT=20

# apply .Xresources changes

xrdb -merge ~/.Xresources

# set fonts

xset +fp /home/anon/.fonts
xset fp rehash

# change default cursor from an x

xsetroot -cursor_name left_ptr

# start sound

exec pulseaudio --start &

# compositing
compton &

# start udiskie for removable drive automounting
udiskie &

# check if existing socket exists and kill for bspwm(doesn't play nice with logging out and in)
rm /tmp/$(ls /tmp | grep bspwm)

# set shell that sxhkd uses to execute commands:
export SXHKD_SHELL=sh

panel &
/home/anon/.fehbg &

# start bspwm and sxhkd
sxhkd -f 100 -c /home/$USER/.config/sxhkd/sxhkdrc &
exec bspwm -c /home/$USER/.config/bspwm/bspwmrc > .startx.log
