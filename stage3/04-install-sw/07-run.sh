cp -p files/first-run.sh ${ROOTFS_DIR}/etc/profile.d/
cd ${ROOTFS_DIR}/etc/profile.d/ && rm -f sshpwd.sh wifi-country.sh
