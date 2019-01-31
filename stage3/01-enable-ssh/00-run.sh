# Enable ssh.
touch ${ROOTFS_DIR}/boot/ssh

# Set the new hostname.
CURRENT_HOSTNAME=`cat ${ROOTFS_DIR}/etc/hostname | tr -d " \t\n\r"`
echo $HOSTNAME > ${ROOTFS_DIR}/etc/hostname
sed -i 's/127.0.1.1.*'"$CURRENT_HOSTNAME"'/127.0.1.1\t'"$HOSTNAME"'/g' ${ROOTFS_DIR}/etc/hosts
