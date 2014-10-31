#
# This file is part of Pod-Spell-CommonMistakes
#
# This software is copyright (c) 2014 by Apocalypse.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict; use warnings;
package Pod::Spelling::CommonMistakes;
$Pod::Spelling::CommonMistakes::VERSION = '1.001';
our $AUTHORITY = 'cpan:APOCAL';

# ABSTRACT: Adaptor for Pod::Spelling to use CommonMistakes as a checker

use parent 'Pod::Spelling'; # Thanks :)

use Pod::Spell::CommonMistakes::WordList qw( _check_common _check_case );

# We override our base...
no warnings 'redefine';

sub _init {
	shift if not ref $_[0];
	my $self = shift;

	# Nothing magical to do :)

	return $self;
}

# Accepts one or more lines of text, returns a list mispelt words.
sub _spell_check_callback {
        my $self = shift;
	my @lines = grep { length $_ } split /\s+/, join( ' ', @_ );
	my $err = _check_common( \@lines );
	$err = { %$err, %{ _check_case( \@lines ) } };

        return keys %$err;
}

1;

__END__

=pod

=encoding UTF-8

=for :stopwords Apocalypse

=head1 NAME

Pod::Spelling::CommonMistakes - Adaptor for Pod::Spelling to use CommonMistakes as a checker

=head1 VERSION

  This document describes v1.001 of Pod::Spelling::CommonMistakes - released October 31, 2014 as part of Pod-Spell-CommonMistakes.

=head1 SYNOPSIS

	die "Don't use this module directly. Please use Pod::Spelling instead.";

=head1 DESCRIPTION

Adaptor for L<Pod::Spelling> as a backend checker.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Pod::Spell::CommonMistakes|Pod::Spell::CommonMistakes>

=back

=head1 AUTHOR

Apocalypse <APOCAL@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Apocalypse.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the
F<LICENSE> file included with this distribution.

=head1 DISCLAIMER OF WARRANTY

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
