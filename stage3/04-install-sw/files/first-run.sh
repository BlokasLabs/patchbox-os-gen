#!/bin/sh
if [ ! -e ~/.config/patchbox-wizard-run ]; then
	sudo patchbox-config wizard
	touch ~/.config/patchbox-wizard-run
fi
