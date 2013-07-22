#!/bin/bash

TARGET_DIR=b-datum-backup-agent-linux-perl/

if [ ! -d $TARGET_DIR ] ; then
	echo "Where is $TARGET_DIR ?"
	exit
fi

if ! which dh-make-perl >/dev/null; then
        echo "please, install dh-make-perl." 1>&2
	exit
fi

if ! which debuild >/dev/null; then
	echo "please, install debuild." 1>&2
	exit
fi

DEB_BUILD_OPTIONS="nocheck" \
DEBFULLNAME="Thiago Rondon" \
EMAIL="staff@b-datum.com" \
dh-make-perl $TARGET_DIR --desc 'b-datum backup' --email 'staff@b-datum.com' --packagename 'b-datum-backup-perl' --intrusive --depends libssl-dev

(cd $TARGET_DIR && debuild --no-tgz-check -us -uc)


