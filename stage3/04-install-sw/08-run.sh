# Set up graphical environment appearance.
cp files/blokas-logo.png ${ROOTFS_DIR}/usr/share/images/
cp files/desktop-items-0.conf ${ROOTFS_DIR}/home/patch/.config/pcmanfm/LXDE-pi/

# Set up MOTD
cp files/motd ${ROOTFS_DIR}/etc/motd
