
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

# Status code for alive
# 1xx - Status
# 2xx - Success
# 3xx - Local Error
# 4xx - Setup Error

use constant ONLINE => 100;    # I'm here
use constant BACKUP => 101;    # Doing..

use constant OK_ALL           => 200;    # Withour problem
use constant OK_UPDATE_CONFIG => 201;    # Configuração atualizada

use constant ERR_PERM_ETC   => 301;      # Please run 'chmod 0400 /configfile'
use constant ERR_NO_PATH    => 302;      # No path information
use constant ERR_PATH_PERM  => 303;      # Path without permission to backup
use constant ERR_FILE_PERM  => 304;      # No permission to a file
use constant ERR_NO_PERL_S3 => 340;      # need to install Net::Amazon::S3

use constant ERR_PART_SIZE    => 401; # part_size option need to be > 5 or < 500
use constant ERR_PATH         => 402; # No path to backup
use constant ERR_TOO_MANY_TRY => 403; # Too many times try to send something.

require Exporter;

our @ISA         = qw(Exporter);
our %EXPORT_TAGS = (
  all => [
    qw/
      BASE_URL BASE_DIR LIMIT_PARTS
      MTIME ETAG UID GID UMASK SYMLINK
      ONLINE BACKUP OK_ALL OK_UPDATE_CONFIG
      ERR_PERM_ETC ERR_NO_PATH ERR_PATH_PERM ERR_FILE_PERM ERR_NO_PERL_S3
      ERR_PART_SIZE ERR_PATH ERR_TOO_MANY_TRY

      /
  ]
);

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT    = qw();

1;

