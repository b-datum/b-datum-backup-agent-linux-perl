use ExtUtils::MakeMaker;

  NAME         => 'bdatum-backup',
  VERSION      => '0.07',
  ABSTRACT     => 'b-datum backup',
  LICENSE      => 'GPLv3',
  EXE_FILES  => ['bdatum-backup', 'bdatum-config'],
  META_MERGE => {
    repository => {
      type => 'git',
      url  => 'git@github.com:b-datum/b-datum-backup-agent-linux-perl.git',
      web  => 'https://github.com/b-datum/b-datum-backup-agent-linux-perl'
    }
  },
  MIN_PERL_VERSION => '5.12.2',
  PREREQ_PM        => {
    'version'                    => 0,
    'LWP::UserAgent::Determined' => 0,
    'LWP::ConnCache'             => 0,
    'IO::Socket::SSL'            => 0,
    'URI'                        => 0,
    'HTTP::Message'              => 0,
    'Digest::MD5::File'          => 0,
    'Digest::MD5'                => 0,
    'File::Next'                 => 0,
    'JSON'                       => 0,
    'Getopt::Long::Descriptive'  => 0,
    'File::MimeInfo'             => 0,
    'Parallel::ForkManager'      => 0,
    'Try::Tiny'                  => 0,
    'DateTime'                   => 0,
    'Time::HiRes'                => 0,
    'Perl6::Junction'            => 0,
    'List::MoreUtils'            => 0,
    'Config::INI'                => 0,
    'File::Slurp'                => 0,
    'File::Temp'                 => 0
  }
);

