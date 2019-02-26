#!/bin/sh
if [ ! -e ~/.config/patchbox-wizard-run ]; then
	touch ~/.config/patchbox-wizard-run
	sudo patchbox-config wizard
fi
