# TODO: Change location of xinitrc

feh --no-fehbg --bg-scale $HOME/Pics/wallpaper &

picom --experimental-backends &

# Faster autorepeat
xset r rate 300 50

# Who cares about Caps Lock anyway
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

xset b off

while true; do
    # Log stderror to a file
    /usr/local/bin/dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
