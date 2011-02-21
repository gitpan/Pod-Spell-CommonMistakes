#
# This file is part of Pod-Spell-CommonMistakes
#
# This software is copyright (c) 2011 by Apocalypse.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict; use warnings;
package Pod::Spell::CommonMistakes;
BEGIN {
  $Pod::Spell::CommonMistakes::VERSION = '1.000';
}
BEGIN {
  $Pod::Spell::CommonMistakes::AUTHORITY = 'cpan:APOCAL';
}

# ABSTRACT: Catches common typos in POD

# Import the modules we need
use Pod::Spell::CommonMistakes::WordList qw( _check_case _check_common );
use Pod::Spell 1.01;
use IO::Scalar 2.110;

# auto-export our 2 subs
use base qw( Exporter );
our @EXPORT_OK = qw( check_pod check_pod_case check_pod_all );


sub check_pod {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_common( $words );
}


sub check_pod_case {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_case( $words );
}


sub check_pod_all {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );

	# Holds the failures we saw
	my $err = _check_common( $words );
	$err = { %$err, %{ _check_case( $words ) } };
	return $err;
}

sub _parse {
	my $pod = shift;

	# TODO if pod is a file, load it - if it's a scalar or a FH or...?

	# Parse the POD!
	my $parser = Pod::Spell->new;
	my $output = '';
	my $out_fh = IO::Scalar->new( \$output );
	$parser->parse_from_file( $pod, $out_fh );

	# Did we see POD in the file?
	if ( length $output ) {
		my @words = split( /\s+/, $output );
		return \@words;
	} else {
		# Ah no POD, we simply return an empty list
		return [];
	}
}

1;


__END__
=pod

=for stopwords OpenLDAP OpenLdap spellchecker wordlist wordlists Lintian

=head1 NAME

Pod::Spell::CommonMistakes - Catches common typos in POD

=head1 VERSION

  This document describes v1.000 of Pod::Spell::CommonMistakes - released February 21, 2011 as part of Pod-Spell-CommonMistakes.

=head1 SYNOPSIS

	#!/usr/bin/perl
	use strict; use warnings;

	use Pod::Spell::CommonMistakes qw( check_pod );

	my $file = $ARGV[0] || 'lib/Pod/Spell/CommonMistakes.pm';
	my $result = check_pod( $file );
	if ( keys %$result == 0 ) {
		print "File passed tests!\n";
	} else {
		print "File failed tests!\n";
		foreach my $k ( keys %$result ) {
			print " Found: '$k' - Possible spelling: '$result->{$k}'?\n";
		}
	}

=head1 DESCRIPTION

This module looks for any typos in your POD. It differs from L<Pod::Spell> or L<Test::Spelling> because it uses a custom wordlist and doesn't
use the system spellchecker. The idea for this came from the L<http://wiki.debian.org/Teams/Lintian> code in Debian, thanks!

To use this, just pass it a filename that has POD in it and you'll get a hashref back. If the hashref is empty that means the checker found
no misspelled words. If it contains keys, then the keys are the bad words and the values are the suggested spelling.

=head1 METHODS

=head2 check_pod( $filename )

This function is what you will usually run. It will run the spell checks against the POD in $filename. Warning: you would need to catch any
exceptions thrown from this function!

It returns a hashref of misspelled words and their suggested spelling. If the hash is empty then there is no errors in the POD.

=head2 check_pod_case( $filename )

This function behaves the same as L</check_pod( $filename )> but it uses a "case" wordlist instead. The difference is that this wordlist
will make sure you capitalize common terms properly. One example is: OpenLdap => OpenLDAP.

NOTE: This does NOT run the same checks as L</check_pod( $filename )>! You would need to use the L</check_pod_all( $filename )> function.

=head2 check_pod_all( $filename )

This function behaves the same as L</check_pod( $filename )> but it runs all the extra checks too. Currently it's just the case wordlist
but others might be added in the future...

=head1 EXPORT

You would need to manually get the function you want.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Pod::Spell>

=item *

L<Test::Pod::Spelling::CommonMistakes>

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Pod::Spell::CommonMistakes

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/Pod-Spell-CommonMistakes>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-Spell-CommonMistakes>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Pod-Spell-CommonMistakes>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/Pod-Spell-CommonMistakes>

=item *

CPAN Forum

L<http://cpanforum.com/dist/Pod-Spell-CommonMistakes>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/Pod-Spell-CommonMistakes>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/P/Pod-Spell-CommonMistakes.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=Pod-Spell-CommonMistakes>

=back

=head2 Email

You can email the author of this module at C<APOCAL at cpan.org> asking for help with any problems you have.

=head2 Internet Relay Chat

You can get live help by using IRC ( Internet Relay Chat ). If you don't know what IRC is,
please read this excellent guide: L<http://en.wikipedia.org/wiki/Internet_Relay_Chat>. Please
be courteous and patient when talking to us, as we might be busy or sleeping! You can join
those networks/channels and get help:

=over 4

=item *

irc.perl.org

You can connect to the server at 'irc.perl.org' and join this channel: #perl-help then talk to this person for help: Apocalypse.

=item *

irc.freenode.net

You can connect to the server at 'irc.freenode.net' and join this channel: #perl then talk to this person for help: Apocal.

=item *

irc.efnet.org

You can connect to the server at 'irc.efnet.org' and join this channel: #perl then talk to this person for help: Ap0cal.

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-pod-spell-commonmistakes at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Pod-Spell-CommonMistakes>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<http://github.com/apocalypse/perl-pod-spell-commonmistakes>

  git clone git://github.com/apocalypse/perl-pod-spell-commonmistakes.git

=head1 AUTHOR

Apocalypse <APOCAL@cpan.org>

=head1 ACKNOWLEDGEMENTS

Props goes out to jawnsy@irc for pointing out a spelling mistake in POE, which prompted me to write this.

B<THANKS> goes out to the Debian Lintian code, as it was a great starting place! L<http://wiki.debian.org/Teams/Lintian>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Apocalypse.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the LICENSE file included with this distribution.

=cut

