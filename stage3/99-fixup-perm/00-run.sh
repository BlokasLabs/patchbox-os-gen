on_chroot << EOF
	chown -R ${FIRST_USER_NAME} /home/${FIRST_USER_NAME}
	chgrp -R ${FIRST_USER_NAME} /home/${FIRST_USER_NAME}

	chmod -R 777 /usr/local/puredata-patches

	apt-get update
	apt-get upgrade -y
	apt-get autoremove -y
EOF
