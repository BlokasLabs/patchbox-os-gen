# Setup VNC server.
on_chroot << EOF
	systemctl enable vncserver-x11-serviced.service
EOF
