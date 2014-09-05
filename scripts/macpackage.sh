#!/bin/bash

#VERSION=$1
VERSION=$(grep \ VERSION Makefile.PL | sed -e "s/^.*\ '//;s/'.*//")
DIR="b-datum-$VERSION"

if [ -z $VERSION ] ; then
	echo "Use: $0 <VERSION>"
	exit
fi

if [ -d "$DIR" ] ; then
	echo "Please, clean $DIR to build this package"
	exit
fi

mkdir $DIR

mkdir -p $DIR/bin
cp bin/* $DIR/bin

mkdir -p $DIR/macos
cp macos/* $DIR/macos

cp scripts/* $DIR

tar cvfzp b-datum-mac-$VERSION.tar.gz $DIR
