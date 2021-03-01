xset -b
xrdb .Xresources
[ -f ~/Downloads/unix.jpg ] && feh --bg-scale ~/Downloads/unix.jpg
ssh-agent > ~/.ssh-agent
source ~/.ssh-agent
urxvt &
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/local/bin/i3 -V -d all >> ~/.i3/logfile
