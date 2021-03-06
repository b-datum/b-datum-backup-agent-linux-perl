package Config::Any::YAML;

use strict;
use warnings;

use base 'Config::Any::Base';

use Carp ();

=head1 NAME

Config::Any::YAML - Load YAML config files

=head1 DESCRIPTION

Loads YAML files. Example:

    ---
    name: TestApp
    Controller::Foo:
        foo: bar
    Model::Baz:
        qux: xyzzy
    

=head1 METHODS

=head2 extensions( )

return an array of valid extensions (C<yml>, C<yaml>).

=cut

sub extensions {
    return qw( yml yaml );
}

=head2 load( $file )

Attempts to load C<$file> as a YAML file.

=cut

our $NO_YAML_XS_WARNING;

sub load {
    my $class = shift;
    my $file  = shift;

    eval { require YAML::XS };
    unless ( $@ ) {
        return YAML::XS::LoadFile( $file );
    }

    Carp::carp
        'Use of YAML::Syck or YAML to parse config files is DEPRECATED. '
        . 'Please install YAML::XS for proper YAML support'
            unless $NO_YAML_XS_WARNING;

    eval { require YAML::Syck; YAML::Syck->VERSION( '0.70' ) };
    unless ( $@ ) {
        open( my $fh, $file ) or die $!;
        my $content = do { local $/; <$fh> };
        close $fh;
        return YAML::Syck::Load( $content );
    }

    require YAML;
    return YAML::LoadFile( $file );
}

=head2 requires_any_of( )

Specifies that this modules requires one of L<YAML::XS>, L<YAML::Syck> (0.70) or
L<YAML> in order to work.

=cut

sub requires_any_of { 'YAML::XS', [ 'YAML::Syck', '0.70' ], 'YAML' }

=head1 AUTHOR

Brian Cassidy E<lt>bricas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2011 by Brian Cassidy

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=head1 SEE ALSO

=over 4 

=item * L<Catalyst>

=item * L<Config::Any>

=item * L<YAML::XS>

=item * L<YAML>

=item * L<YAML::Syck>

=back

=cut

1;
