xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
xautolock -time 10 -locker slock &
exec xmonad
