
package bdatum::Constants;

use strict;
use warnings;

our $VERSION = '0.01';

use constant BASE_URL => $ENV{'BDATUM_BASE_URL'} || 'https://api.b-datum.com';
use constant BASE_DIR => "$ENV{HOME}/.b-datum";

use constant LIMIT_PARTS => 10000;

use constant MTIME   => 0;
use constant ETAG    => 1;
use constant UID     => 2;
use constant GID     => 3;
use constant UMASK   => 4;
use constant SYMLINK => 5;

require Exporter;

our @ISA         = qw(Exporter);
our %EXPORT_TAGS = (
  all => [
    qw/
      BASE_URL BASE_DIR LIMIT_PARTS
      MTIME ETAG UID GID UMASK SYMLINK
      /
  ]
);

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT    = qw();

1;

