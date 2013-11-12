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

echo "%define rpmversion $VERSION" > ~/rpmbuild/SPECS/b-datum-linux.spec
cat b-datum-linux/linux/b-datum-linux.spec >> ~/rpmbuild/SPECS/b-datum-linux.spec

cp -rfpad b-datum-linux ~/rpmbuild/SOURCES/b-datum-$VERSION
(cd ~/rpmbuild/SOURCES/ && tar cvfzp b-datum-$VERSION.tar.gz b-datum-$VERSION)
(cd ~/rpmbuild/SPECS && rpmbuild -bb --define "_binary_filedigest_algorithm 1" --define "_binary_payload 1" b-datum-linux.spec)

