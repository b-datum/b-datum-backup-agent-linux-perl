
package bdatum::Util;

use strict;
use warnings;
use Sys::Syslog qw(:standard :macros);

sub new {
    my $class = shift;
    my $self  = {
        _debug => shift,
        _daemon => shift,
        };
    bless $self, $class;
    return $self;
}

sub disable_log {
    shift->{_disable_log} = 1;
}

sub validate_key {
    my $self = shift;
    my $key = shift || &_log_error( "Required option missing.", 64 );
    my $val = $key =~ /^[a-zA-Z0-9]{20}$/ ? 1 : 0;
    $self->log_error("The key must be [a-zA-Z0-9]{20} -- $key") unless $val;
    return $val;
}

sub validate_path {
    my $self = shift;
    my $path = shift || return 0;
    my $val = -d $path and -r $path;
    $self->log_error("The directory name is invalid -- $path") unless $val;
    return $val;
}

sub _log {
    my $self = shift;
    return if $self->{_disable_log};

    my $level = shift;
    my $msg = join( ' ', @_ );

    my $syslog_level = LOG_INFO;
    $syslog_level = LOG_DEBUG   if $level eq 'debug';
    $syslog_level = LOG_WARNING if $level eq 'warn';
    $syslog_level = LOG_ERR     if $level eq 'error';

    openlog( $0, 'pid', LOG_USER );
    syslog( $syslog_level, "[$level] $msg" );
    closelog();

    print "[$level] $msg\n" unless $self->{_daemon};
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
