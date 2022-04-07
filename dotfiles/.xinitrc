## LOCATION:     ~/.xinitrc
## AUTHOR:       AISK11
## VERSION:      1.0.0
## CREATED:      2022-04-08
## UPDATED:      2022-04-08
## DESCRIPTION:  Configuration file xinit.
## DEPENDENCIES: xorg-xinit

## Disable screen saving.
xset s off
xset s noblank
xset -dpms

## Execute i3 in fullscreen mode after X has started.
xrandr -s 1920x1080
exec i3
