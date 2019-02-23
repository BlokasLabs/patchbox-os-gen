# Set up .pdsettings link for root user, so the same settings are used for normal and root user.
on_chroot << EOF
	ln -s /home/${FIRST_USER_NAME}/.pdsettings /root/.pdsettings
EOF

# Copy preconfigured PD settings.
cp files/.pdsettings ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.pdsettings

# Copy preconfigured Audacity settings.
mkdir -p ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.audacity-data
cp files/audacity.cfg ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.audacity-data/

# Install desktop shortcuts.
mkdir -p ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop
cp files/*.desktop ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/

# For unknown reason SuperColliderIDE.desktop does not show up in system menu, unless it's renamed...
mv ${ROOTFS_DIR}/usr/share/applications/SuperColliderIDE.desktop ${ROOTFS_DIR}/usr/share/applications/SuperCollider.desktop

# Copy preconfigured Pianoteq settings.
mkdir -p ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/Modartt
cp files/Pianoteq64.prefs ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/Modartt/
