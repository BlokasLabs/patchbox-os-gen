# Install touchosc2midi

install -m 644 files/*.service ${ROOTFS_DIR}/usr/lib/systemd/system

# Attempt this two times, first without 'stop on error', then with it enabled.
# Sometimes simply rerunning the install commands is needed to get over intermittent
# errors.
set +e
for i in 1 2; do
	on_chroot << EOF
		pip install cython==0.25.2 --install-option="--no-cython-compile"
		pip install touchosc2midi
EOF
    exit_status=$?
	if [ $exit_status -eq 0 ]; then
        break
    fi
	set -e
done

on_chroot << EOF
	systemctl daemon-reload
	systemctl enable touchosc2midi
EOF

on_chroot << EOF
    apt-get remove -y liblo-dev libasound-dev libjack-jackd2-dev
EOF

