#!/bin/bash

CURL=/usr/bin/curl

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
  for PKG in build-essential lib-ssl ; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PKG|grep "install ok installed")
    echo Checking for $PKG: $PKG_OK

    if [ "" == "$PKG_OK" ]; then
      echo "No $PKG. Setting up $PKG."
      echo "please, do 'apt-get install $PKG'"
    fi
  done
fi

$CURL -kL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

if ! grep "source ~/perl5/perlbrew/etc/bashrc" ~/.bashrc ; then
	echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
fi

perlbrew -f install-patchperl
perlbrew install -n perl-5.12.2
perlbrew switch perl-5.12.2 
perlbrew -f install-cpanm
cpanm -n inc::Module::Install local::lib Log::Syslog::Fast MooseX::Traits Module::Extract::Use

mkdir -p $HOME/bin
$CURL -X GET https://raw.github.com/b-datum/b-datum-backup-agent-linux-perl/master/backup_agent > $HOME/bin/backup_agent

perl -MModule::Extract::Use -E 'say $_ for Module::Extract::Use->new->get_modules(@ARGV)' $HOME/bin/backup_agent| cpanm -n
cpanm LWP::Protocol::https

chmod +x $HOME/bin/backup_agent

