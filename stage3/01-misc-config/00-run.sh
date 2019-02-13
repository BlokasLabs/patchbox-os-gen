# Enable ssh.
touch ${ROOTFS_DIR}/boot/ssh

# Set the new hostname.
CURRENT_HOSTNAME=`cat ${ROOTFS_DIR}/etc/hostname | tr -d " \t\n\r"`
echo $HOSTNAME > ${ROOTFS_DIR}/etc/hostname
sed -i 's/127.0.1.1.*'"$CURRENT_HOSTNAME"'/127.0.1.1\t'"$HOSTNAME"'/g' ${ROOTFS_DIR}/etc/hosts

# Make a link from 'pi' home to the configured user.
# This is done in order to make the experience of using
# this image more seamless, as a lot of information or
# guides on the net use /home/pi in the commands.
on_chroot << EOF
	ln -s /home/${FIRST_USER_NAME} /home/pi
EOF
