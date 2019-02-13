cp files/pisound-ctl.service ${ROOTFS_DIR}/lib/systemd/system

on_chroot << EOF
	systemctl daemon-reload

	cd /usr/local/pisound
	git fetch
	git checkout patchbox
EOF
