#!/bin/bash

TARGET_DIR=b-datum-linux/

if [ ! -d $TARGET_DIR ] ; then
	echo "Where is $TARGET_DIR ?"
	exit
fi

if ! which dh-make-perl >/dev/null; then
        echo "please, install dh-make-perl." 1>&2
	exit
fi

if ! which debuild >/dev/null; then
	echo "please, install devscripts." 1>&2
	exit
fi

rm -rf $TARGET_DIR/fatlib
DEB_BUILD_OPTIONS="nocheck" \
DEBFULLNAME="Thiago Rondon" \
EMAIL="staff@b-datum.com" \

dh-make-perl $TARGET_DIR \
	--desc 'Provides tools for backup and restore files with b-datum.com' \
	--email 'staff@b-datum.com' \
	--packagename 'b-datum' \
	--intrusive

cp $TARGET_DIR/linux/debian/postinst $TARGET_DIR/debian/postinst
cp $TARGET_DIR/linux/debian/watch $TARGET_DIR/debian/watch
cp $TARGET_DIR/Changes $TARGET_DIR/debian/changelog
(cd $TARGET_DIR && debuild --no-tgz-check -us -uc)


