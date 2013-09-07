use ExtUtils::MakeMaker;

WriteMakefile(
  NAME       => 'bdatum-backup',
  VERSION    => '0.22',
  ABSTRACT   => 'b-datum backup',
  LICENSE    => 'GPLv3',
  EXE_FILES  => [ 'bin/bdatum-backup', 'bin/bdatum-restore', 'bdatum-config' ],
  META_MERGE => {
    repository => {
      type => 'git',
      url  => 'git@github.com:b-datum/b-datum-linux.git',
      web  => 'https://github.com/b-datum/b-datum-linux'
    }
  },
  MIN_PERL_VERSION => '5.12.2',
  PREREQ_PM        => {
    'Net:SSL'            => 0,
    'Net::SSLeay'        => 0,
  }
);

