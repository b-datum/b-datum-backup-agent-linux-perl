#!/bin/bash

LABEL="com.bdatum.backup.mac.plist"
LAUNCHDIR="$HOME/Library/LaunchAgents"
PLISTU="$LAUNCHDIR/$LABEL"

if [ -f $PLISTU ] ; then
  launchctl unload -w $PLISTU
fi

if [ -f /usr/bin/bdatum-backup ] ; then
sudo -p "Please, enter root password:" rm -f /usr/bin/bdatum-backup
fi

if [ -f /usr/bin/bdatum-restore ] ; then
sudo -p "Please, enter root password:" rm -f /usr/bin/bdatum-restore
fi

if [ -f /usr/bin/bdatum-config ] ; then
sudo -p "Please, enter root password:" rm -f /usr/bin/bdatum-config
fi

