#!/bin/bash -e

install -m 644 files/blokas.list ${ROOTFS_DIR}/etc/apt/sources.list.d/
install -m 644 files/blokas-archive-keyring.gpg ${ROOTFS_DIR}/usr/share/keyrings/

on_chroot << EOF
apt-get update
EOF
