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

$CURL -kL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
perlbrew install-patchperl
perlbrew install -n perl-5.12.2
perlbrew switch perl-5.12.2
perlbrew install-cpanm
cpanm -n inc::Module::Install local::lib Log::Syslog::Fast MooseX::Traits Module::Extract::Use
“perl -MModule::Extract::Use -E 'say $_ for Module::Extract::Use->new->get_modules(@ARGV)' backup_agent| cpanm”
cpanm LWP::Protocol::https
mkdir $USER/bin
$CURL -X GET https://raw.github.com/b-datum/b-datum-backup-agent-linux-perl/master/backup_agent > $USER/bin/backup_agent

