##dotfiles
my dotfiles for BSPWM and others.

Things to keep in mind:

i2c errors? http://binbashblog.blogspot.ca/2014/01/dell-xps13-developer-editiong-haswell.html

on login, if headphones are already plugged in, sound comes out speaker? http://askubuntu.com/questions/113704/make-pulseaudio-prefer-external-audio-device

panel crashing because of this error?
```
lxpanel: cairo-scaled-font.c:459: _cairo_scaled_glyph_page_destroy: Assertion `!scaled_font->cache_frozen' failed.
```
sudo pacman -S ttf-droid

###for centos

looking for dunst/i3/dzen2? http://copr-be.cloud.fedoraproject.org/results/maxamillion/epel7-i3wm/epel-7-x86_64/

bspwm not working? https://github.com/baskerville/bspwm/archive/b0e8dd383e906589113b75fdfcb9ce9d20a863f4.zip

php not working? make sure "fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;" is in nginx.conf, and nginx has permissions to php folders and /var/lib/php/session/

or, try this:
```nginx
location /phpmyadmin {
    disable_symlinks off;
}
```
