#!/bin/sh
if [ ! -e ~/.config/patchbox-wizard-run ]; then
	touch ~/.config/patchbox-wizard-run
	sudo chmod -x /etc/update-motd.d/21-patchbox-useful-resources
	sudo patchbox-config wizard
	clear && cat /run/motd.dynamic
fi
