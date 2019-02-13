# Customizations for Jack.
echo @audio - memlock 256000 >> ${ROOTFS_DIR}/etc/security/limits.conf
echo @audio - rtprio 75 >> ${ROOTFS_DIR}/etc/security/limits.conf

cp -p files/jackdrc ${ROOTFS_DIR}/etc/

# Set up Jack user and add it to audio group.
on_chroot << EOF
	useradd -r -s /bin/false jack
	adduser jack audio
	adduser ${FIRST_USER_NAME} jack
	adduser root jack
EOF

# Set up environment variable to enable sharing of Jack server.
echo "JACK_PROMISCUOUS_SERVER=jack" >> ${ROOTFS_DIR}/etc/environment

# Set up Jack systemd service
mkdir -p ${ROOTFS_DIR}/usr/lib/systemd/system
install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

on_chroot << EOF
	systemctl daemon-reload
	systemctl enable jack
EOF
