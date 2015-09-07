#! /bin/bash
export PANEL_HEIGHT=20

xrdb -merge ~/.Xresources

xset +fp /home/anon/.fonts
xset fp rehash

xsetroot -cursor_name left_ptr

exec pulseaudio --start &

compton &

udiskie &

panel &
/home/anon/.fehbg &
sxhkd -f 100 &
exec bspwm
