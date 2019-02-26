if [ ! -d ${ROOTFS_DIR}/usr/local/patchbox-cli ]; then
	echo "Cloning patchbox-cli repository from https://github.com/BlokasLabs/patchbox-cli..."
	git clone https://github.com/BlokasLabs/patchbox-cli.git ${ROOTFS_DIR}/usr/local/patchbox-cli
else
	echo "Updating patchbox-cli repository with latest stuff in https://github.com/BlokasLabs/patchbox-cli..."
	cd ${ROOTFS_DIR}/usr/local/patchbox-cli && git -c user.name="apt-get" -c user.email="apt@get" stash && git pull
fi

on_chroot << EOF
	cd /usr/local/patchbox-cli && sudo pip install --editable .
EOF

cp -p files/first-run.sh ${ROOTFS_DIR}/etc/profile.d/
cd ${ROOTFS_DIR}/etc/profile.d/ && rm -f sshpwd.sh wifi-country.sh
