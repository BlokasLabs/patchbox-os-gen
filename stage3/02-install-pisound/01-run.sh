install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system
rm -f ${ROOTFS_DIR}/lib/systemd/system/pisound-ctl.service

on_chroot << EOF
	systemctl daemon-reload

	systemctl enable wifi-hotspot
	systemctl enable cpu_performance_scaling_governor
	systemctl disable raspi-config # raspi-config is only enabling 'ondemand' governor as of 2018.08.19

	cd /usr/local/pisound
	git fetch
	git checkout patchbox
EOF
