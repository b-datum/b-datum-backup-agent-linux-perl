
package bdatum::Util;

use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

use bdatum::Constants ':all';
use Module::Load::Conditional qw(can_load);

# Yes, Fedora don't have any workaround for syslog.
our $can_syslog = 0;
if ( can_load( modules => { 'Sys::Syslog' => undef } ) ) {
  use Sys::Syslog qw(:standard :macros);
  $can_syslog = 1;
}

sub new {
  my $class = shift;
  my $self  = {
    _debug  => shift,
    _daemon => shift,
  };
  bless $self, $class;
  return $self;
}

sub disable_log {
  shift->{_disable_log} = 1;
}

sub set_debug {
  my ( $self, $value ) = @_;
  $self->{_debug} = $value;
}

sub set_daemon {
  my ( $self, $value ) = @_;
  $self->{_daemon} = $value;
}

sub set_node_key {
  my ( $self, $value ) = @_;
  $self->{node_key} = $value;
}

sub set_partner_key {
  my ( $self, $value ) = @_;
  $self->{partner_key} = $value;
}

sub set_path {
  my ( $self, $value ) = @_;
  $self->{path} = $value;
}

sub validate_key {
  my $self = shift;
  my $key  = shift || $self->log_error( "Invalid partner or node key", 64 );
  my $val  = $key =~ /^[a-zA-Z0-9]{20}$/ ? 1 : 0;
  $self->log_error("The key must be [a-zA-Z0-9]{20} -- $key") unless $val;
  return $val;
}

sub validate_path {
  my $self = shift;
  my $path = shift || return 0;
  map {
    my $path = $_;
    my $val = -d $path and -r $path;
    return 0 unless $val;
    #$self->log_error("The directory name is invalid -- $path") unless $val;
  } split /;/, $path;

  return $path;
}

sub validate_basedir {
  my $self = shift;
  my $path = shift || return 0;
  my $ok   = ( -d $path ) && ( -w $path );

  if ( !$ok ) {
    $self->log_error(
      "The directory does not exist or is not writable -- $path");
    $self->log_error( "Required option missing: --basedir", 64 );
  }

  return $ok;
}

sub make_control_file {
  my ( $self, $suffix ) = @_;

  if ( !$self->{node_key} or !$self->{partner_key} or !$self->{path} ) {
    $self->log_error(
"Please, set the path, node_key and partner_key to make control file for $suffix",
      64
    );
    return;
  }

  my $base =
    md5_hex( $self->{node_key} . $self->{partner_key} . $self->{path} );
  return join( '/', BASE_DIR, "$base.$suffix" );
}

sub _log {
  my $self = shift;
  return if $self->{_disable_log};

  my $level = shift;
  my $msg = join( ' ', @_ );

  print "[$level] $msg\n" unless $self->{_daemon};

  return unless $can_syslog;

  my $syslog_level = LOG_INFO;
  $syslog_level = LOG_DEBUG   if $level eq 'debug';
  $syslog_level = LOG_WARNING if $level eq 'warn';
  $syslog_level = LOG_ERR     if $level eq 'error';

  openlog( $0, 'pid', LOG_USER );
  syslog( $syslog_level, "[$level] $msg" );
  closelog();

  return 1;
}

sub log_debug {
  my $self = shift;
  return unless $self->{_debug};
  return $self->_log( 'debug', @_ );
}

sub log_error {
  my ( $self, $msg, $exit ) = @_;
  $self->_log( 'error', $msg );
  return if $self->{_disable_log};
  exit $exit if $exit;
}

sub log_info {
  my $self = shift;
  return $self->_log( 'info', @_ );
}

sub log_warn {
  my $self = shift;
  return $self->_log( 'warn', @_ );
}

1;
