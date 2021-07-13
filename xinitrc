exec feh --bg-fill .wallpapers/featherine.jpg &
exec picom --config .config/picom/picom.conf &
dwmstatus 2>&1 >/dev/null &
xset s off -dpms & xset m 0 0 &
xinput set-prop 8 298 0, 1 &
if [ ! -f /dev/shm/looking-glass ]; then
	touch /dev/shm/looking-glass &&
	chmod 660 /dev/shm/looking-glass &&
	chown rtry:kvm /dev/shm/looking-glass
fi
exec dwm
