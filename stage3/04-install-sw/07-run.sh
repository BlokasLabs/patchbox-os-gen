on_chroot << EOF
	if [ ! -d "/usr/local/patchbox-cli" ]; then
		echo "Cloning patchbox-cli repository from https://github.com/BlokasLabs/patchbox-cli..."
		git clone https://github.com/BlokasLabs/patchbox-cli.git /usr/local/patchbox-cli
	else
		echo "Updating patchbox-cli repository with latest stuff in https://github.com/BlokasLabs/patchbox-cli..."
		cd /usr/local/patchbox-cli && git -c user.name="apt-get" -c user.email="apt@get" stash && git pull
	fi

	cd /usr/local/patchbox-cli && sudo pip install --editable .
EOF

cp -p files/first-run.sh ${ROOTFS_DIR}/etc/profile.d/
cd ${ROOTFS_DIR}/etc/profile.d/ && rm -f sshpwd.sh wifi-country.sh
