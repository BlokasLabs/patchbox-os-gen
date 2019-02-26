# Allow 'startx' to be used over SSH.
sed -i 's/allowed_users=console/allowed_users=anybody/g' ${ROOTFS_DIR}/etc/X11/Xwrapper.config

# Set screensaver to blank screen.
echo mode: blank > ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.xscreensaver

# Fix up policy for 'patch' user.
install -m 644 files/60-desktop-policy.conf ${ROOTFS_DIR}/etc/polkit-1/localauthority.conf.d/

# Install hostapd.conf with changed SSID.
install -m 644 files/hostapd.conf ${ROOTFS_DIR}/etc/hostapd/hostapd.conf
