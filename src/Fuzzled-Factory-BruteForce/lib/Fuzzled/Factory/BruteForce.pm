# $Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-BruteForce/lib/Fuzzled/Factory/BruteForce.pm,v 1.1.1.1 2012-10-30 16:43:53 timb Exp $
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# (c) Tim Brown, 2008
# <mailto:timb@nth-dimension.org.uk>
# <http://www.nth-dimension.org.uk/> / <http://www.machine.org.uk/>

package Fuzzled::Factory::BruteForce;

use 5.008007;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use Fuzzled::Factory::BruteForce ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);

our $VERSION = ('$Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-BruteForce/lib/Fuzzled/Factory/BruteForce.pm,v 1.1.1.1 2012-10-30 16:43:53 timb Exp $' =~ m/.Header: .* ([\d.]+) .*/)[0];

# Preloaded methods go here.

sub new {
	my $class;
	my $self;
	my $namespacecharacters;
	$class = shift;
	$self = {};
	bless($self, $class);
	$namespacecharacters = shift;
	$self->{'namespacecharacters'} = $namespacecharacters;
	$self->{'currentnamespacecharacter'} = 1;
	$self->{'maximumnamespacecharacter'} = @{$namespacecharacters};
	return $self;
}

sub generate {
	my $self;
	my $resultstring;
	$self = shift;
	if ($self->{'currentnamespacecharacter'} > $self->{'maximumnamespacecharacter'}) {
		return "";
	}
	$resultstring = $self->{'namespacecharacters'}[($self->{'currentnamespacecharacter'} - 1)];
	$self->{'currentnamespacecharacter'} ++;
	return $resultstring;
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Fuzzled::Factory::BruteForce - Perl extension for Fuzzled to brute force namespaces

=head1 SYNOPSIS

  use Fuzzled::Factory::BruteForce;

  my $bruteforcetesthandle;
  my $bruteforcestring;

  $bruteforcetesthandle = Fuzzled::Factory::BruteForce->new(["\r", "\n", "\r\n"]);
  while ($bruteforcestring = $bruteforcetesthandle->generate()) {
  	print $bruteforcestring . "\n";
  }

=head1 DESCRIPTION

C<Fuzzled::Factory::BruteForce> is a Perl extension for Fuzzled to brute force namespaces.  The following methods are available:

=over 4

=item Fuzzled::Factory::BruteForce->new(<namespacecharacters>)

Constructs a new C<Fuzzled::Factory::BruteForce> object describing the range of the namespace.

=item <resultstring> = Fuzzled::Factory::BruteForce->generate()

Generates a single string to fuzz the connection.

Returns the result string.

=head1 SEE ALSO

=head1 AUTHOR

(c) Tim Brown, 2008
<mailto:timb@nth-dimension.org.uk>

=head1 COPYRIGHT AND LICENSE

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

=cut