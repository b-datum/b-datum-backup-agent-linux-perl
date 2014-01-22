#!/bin/bash

LABEL="com.bdatum.backup.mac.plist"
PLISTU="$HOME/Library/LaunchAgents/$LABEL"

if [ -f $PLISTU ] ; then
  launchctl unload -w $PLISTU
fi

sudo -p "Please, enter root password:" cp bin/bdatum-backup /usr/bin
sudo cp bin/bdatum-restore /usr/bin
sudo cp bin/bdatum-config /usr/bin

bdatum-config

if [ -f $PLISTU ] ; then
  sudo rm $PLISTU
fi

cp macos/$LABEL $PLISTU

launchctl load -w $PLISTU

