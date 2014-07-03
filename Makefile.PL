use ExtUtils::MakeMaker 6.76;

my $dir_libs = ['lib'];
$dir_libs = [] if -f '/etc/redhat-release';

WriteMakefile(
  NAME       => 'bdatum',
  AUTHOR     => 'bdatum-staff',
  DISTNAME   => 'bdatum',
  VERSION    => '1.05', # dh-make-perl, we can't use VERSION_FROM.
  ABSTRACT   => 'Provides tools for backup and restore files with b-datum.com',
  LICENSE    => 'GPLv3',
  EXE_FILES  => [ 'bin/bdatum-backup', 'bin/bdatum-restore', 'bin/bdatum-config' ],
  META_MERGE => {
    repository => {
      type => 'git',
      url  => 'git@github.com:b-datum/b-datum-linux.git',
      web  => 'https://github.com/b-datum/b-datum-linux'
    }
  },
  MIN_PERL_VERSION => '5.010',
  PREREQ_PM        => {
    'Net::SSLeay'        => 0,
    'IO::Socket::SSL'    => 0,
  },
  NO_PACKLIST => 1,
  NO_PERLLOCAL => 1,
  PMLIBDIRS => $dir_libs,
);

sub MY::postamble {
    q{
    install:
        cp linux/start-script /etc/init.d/b-datum
};
}

