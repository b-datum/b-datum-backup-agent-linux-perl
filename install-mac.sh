#!/bin/bash

LABEL="com.bdatum.backup.mac"
PLIST="/Library/LaunchDaemons/$LABEL.plist"

if [ -f $PLIST ] ; then
  launchctl unload -w $PLIST
fi

sudo cp bin/bdatum-backup /usr/bin
sudo cp bin/bdatum-restore /usr/bin
sudo cp bin/bdatum-config /usr/bin

bdatum-config

sudo cp macos/$LABEL $PLIST
launchctl load -w $PLIST

