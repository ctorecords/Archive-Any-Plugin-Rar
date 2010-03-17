package Archive::Any::Plugin::Rar;

use warnings;
use strict;

use base 'Archive::Any::Plugin';

use Archive::Rar;

=head1 NAME

Archive::Any::Plugin::Rar - Archive::Any wrapper around Archive::Rar

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Do not use this module directly.  Instead, use Archive::Any.

=cut

sub can_handle {
    return(
           'application/x-rar',
          );
}

sub files {
    my( $self, $file ) = @_;
    my $t = Archive::Rar->new( -archive => $file );
    $t->List();
    map { $_->{name} } @{$t->{list}};
}

sub extract {
    my ( $self, $file ) = @_;

    my $t = Archive::Rar->new( -archive => $file );
    return $t->Extract;
}

sub type {
    my $self = shift;
    return 'rar';
}

=head1 SEE ALSO

Archive::Any, Archive::Rar

=head1 AUTHOR

Dmitriy V. Simonov, C<< <dsimonov at gmail.com> >>

=head1 ACKNOWLEDGEMENTS

Thanks to Clint Moore for L<Archive::Any> 

=head1 COPYRIGHT & LICENSE

Copyright 2010 Dmitriy V. Simonov.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

=cut

1; # End of Archive::Any::Plugin::Rar
