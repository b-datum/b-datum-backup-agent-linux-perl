#!/bin/bash

CURL=/usr/bin/curl
PERL_VERSION=5.16.3
APP=bdatum-backup
BIN=$HOME/bin/$APP
BASEBIN=`dirname $BIN`

if [ ! -d $HOME ] ; then
	echo '$HOME is not a directory'
	exit
fi


if [ "$(id -u)" == "0" ]; then
   echo "This script can't be run as root" 1>&2
   exit 1
fi

if which curl >/dev/null; then
    CURL=`which curl`
else
    echo "please, install curl." 1>&2
    exit
fi

if [ -f /etc/debian_version ] ; then
  for PKG in build-essential libssl-dev ; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PKG|grep "install ok installed")
    echo Checking for $PKG: $PKG_OK

    if [ "" == "$PKG_OK" ]; then
      echo "No $PKG. Setting up $PKG."
      echo "please, do 'apt-get install $PKG'"
      exit
    fi
  done
fi

if [ ! $NOT_INSTALL_PERLBREW ] ; then
  $CURL -kL http://install.perlbrew.pl | bash

  if [ ! -f $HOME/perl5/perlbrew/bin/perlbrew ] ; then
     echo "Where is perlbrew ?"
     exit
  fi

  source ~/perl5/perlbrew/etc/bashrc

  if ! grep "source ~/perl5/perlbrew/etc/bashrc" ~/.bashrc ; then
	  echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
  fi

  perlbrew -f install-patchperl
  perlbrew install -n perl-$PERL_VERSION
  perlbrew switch perl-$PERL_VERSION
  perlbrew -f install-cpanm

  source ~/perl5/perlbrew/etc/bashrc
fi

cpanm -n inc::Module::Install LWP::Protocol::https

mkdir -p $BASEBIN


$CURL -X GET https://raw.github.com/b-datum/b-datum-backup-agent-linux-perl/master/bdatum-backup > $BIN
perl -MModule::Extract::Use -E 'say $_ for Module::Extract::Use->new->get_modules(@ARGV)' $BIN| cpanm -n

chmod +x $BIN

