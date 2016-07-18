xrdb -merge $HOME/.Xresources
xautolock -time 10 -locker slock &
exec xmonad
