use ExtUtils::MakeMaker 6.76;

WriteMakefile(
  NAME       => 'bdatum-backup',
  VERSION    => '0.23',
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
);

