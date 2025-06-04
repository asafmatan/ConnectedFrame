#!/bin/bash

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# Launch the Tkinter-based picture frame application in a minimal X session.
# Starting X directly avoids running a full desktop environment and
# keeps resource usage low while still providing the display needed for
# the Python GUI.

rm /tmp/.X0-lock &>/dev/null || true
hostname -b localhost
echo '#!/bin/sh' > ~/.xinitrc
echo xterm >> ~/.xinitrc
chmod 755 ~/.xinitrc
startx &

/usr/src/app/connectedframe.py
