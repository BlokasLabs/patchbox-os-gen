# Set up graphical environment appearance.
cp files/blokas-logo.png files/blokas-logo.svg ${ROOTFS_DIR}/usr/share/images/
cp files/blokas-logo.svg ${ROOTFS_DIR}/usr/share/icons/PiXflat/32x32/apps/
mkdir -p ${ROOTFS_DIR}/home/patch/.config/pcmanfm/LXDE-pi/
cp files/desktop-items-0.conf ${ROOTFS_DIR}/home/patch/.config/pcmanfm/LXDE-pi/
cp files/pi-greeter.conf ${ROOTFS_DIR}/etc/lightdm/
mkdir -p ${ROOTFS_DIR}/home/patch/.config/lxpanel/LXDE-pi/panels
cp files/lxde-panel ${ROOTFS_DIR}/home/patch/.config/lxpanel/LXDE-pi/panels/panel

# Configure 1280x720 screen size by default.
sed -i -E "s/#?hdmi_group=[0-9]+/hdmi_group=2/" ${ROOTFS_DIR}/boot/config.txt
sed -i -E "s/#?hdmi_mode=[0-9]+/hdmi_mode=85/" ${ROOTFS_DIR}/boot/config.txt
sed -i -E "s/#?hdmi_force_hotplug=[0-9]+/hdmi_force_hotplug=1/" ${ROOTFS_DIR}/boot/config.txt
