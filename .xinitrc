xset -b
xrdb .Xresources
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/local/bin/i3 -V -d all >> ~/.i3/logfile
