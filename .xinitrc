# sbz's .xinitrc

# set background
[ -f $(which xset) ] && xset -b
[ -f ~/Downloads/unix.jpg ] && feh --bg-scale ~/Downloads/unix.jpg

# set X config
[ -f $(which xrdb) ] && xrdb .Xresources

# ssh agent
ssh-agent > ~/.ssh-agent
source ~/.ssh-agent

# terminal
[ -f $(which urxvt) ] && urxvt &

# window manager
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/local/bin/i3 -V -d all >> ~/.i3/logfile
