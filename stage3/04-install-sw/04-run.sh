# Allow 'startx' to be used over SSH.
sed -i 's/allowed_users=console/allowed_users=anybody/g' ${ROOTFS_DIR}/etc/X11/Xwrapper.config
