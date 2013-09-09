#!/bin/bash

VERSION=$1

if [ -z $VERSION ] ; then
	echo "Use: bash b-datum-linux/scripts/rpmpackage.sh 0.01"
	exit
fi

if [ ! -d b-datum-linux/ ] ; then
	echo "Please, run out of workdir"
	exit
fi

if [ -d ~/rpmbuild/ ] ; then
	echo "Please, clean ~/rpmbuild"
	exit
fi

if [ -f ~/.rpmmacros ] ; then
	echo "Please, clean ~/.rpmmacros"
	exit
fi

mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
cp b-datum-linux/b-datum-linux.spec ~/rpmbuild/SPECS
cp -rfpad b-datum-linux ~/rpmbuild/SOURCES/b-datum-linux-$VERSION
(cd ~/rpmbuild/SOURCES/b-datum-linux-$VERSION && perl Makefile.PL PREFIX=/usr)
(cd ~/rpmbuild/SOURCES/ && tar cvfzp b-datum-linux-$VERSION.tar.gz b-datum-linux-$VERSION)
(cd ~/rpmbuild/SPECS && rpmbuild -bb --define "_binary_filedigest_algorithm 1" --define "_binary_payload 1" b-datum-linux.spec)
