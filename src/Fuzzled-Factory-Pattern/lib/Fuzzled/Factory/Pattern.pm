# $Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-Pattern/lib/Fuzzled/Factory/Pattern.pm,v 1.2 2012-10-30 17:00:51 timb Exp $
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

package Fuzzled::Factory::Pattern;

use 5.008007;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use Fuzzled::Factory::Pattern ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);

our $VERSION = ('$Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-Pattern/lib/Fuzzled/Factory/Pattern.pm,v 1.2 2012-10-30 17:00:51 timb Exp $' =~ m/.Header: .* ([\d.]+) .*/)[0];

# Preloaded methods go here.

sub new {
	my $class;
	my $self;
	$class = shift;
	$self = {};
	bless($self, $class);
	$self->{'currentlength'} = shift;
	$self->{'maximumlength'} = shift;
	$self->{'badcharacters'} = shift;
	return $self;
}

sub generate {
	my $self;
	my $lengthcounter;
	my $currentcharacter;
	my $okflag;
	my $badcharacter;
	my $resultstring;
	$self = shift;
	if ($self->{'currentlength'} > $self->{'maximumlength'}) {
		return "";
	}
	srand($self->{'currentlength'});
	for ($lengthcounter = 1; $lengthcounter <= $self->{'currentlength'}; $lengthcounter ++) {
		$currentcharacter = chr(int(rand(255)));
		$okflag = 0;
		while ($okflag == 0) {
			$okflag = 1;
			foreach $badcharacter (@{$self->{'badcharacters'}}) {
				if ($currentcharacter eq $badcharacter) {
					$currentcharacter = chr(int(rand(255)));
					$okflag = 0;
					last;
				}
			}
		}
		$resultstring = $resultstring . $currentcharacter;
	}
	$self->{'currentlength'} ++;
	return $resultstring;
}

sub calculate {
	my $self;
	my $maximumlength;
	my $targetstring;
	my $lengthcounter;
	my $currentcharacter;
	my $okflag;
	my $badcharacter;
	my $targetoffset;
	my $patternstring;
	$self = shift;
	$maximumlength = shift;
	$targetstring = shift;
	srand($maximumlength);
	for ($lengthcounter = 1; $lengthcounter <= $maximumlength; $lengthcounter ++) {
		$currentcharacter = chr(int(rand(255)));
		$okflag = 0;
		while ($okflag == 0) {
			$okflag = 1;
			foreach $badcharacter (@{$self->{'badcharacters'}}) {
				if ($currentcharacter eq $badcharacter) {
					$currentcharacter = chr(int(rand(255)));
					$okflag = 0;
					last;
				}
			}
		}
		$patternstring = $patternstring . $currentcharacter;
	}
	$targetoffset = index($patternstring, $targetstring);
	return $targetoffset;
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Fuzzled::Factory::Pattern - Perl extension for Fuzzled to create patterned strings

=head1 SYNOPSIS

  use Fuzzled::Factory::Pattern;

  my $patterntesthandle;
  my $patternstring;

  $patterntesthandle = Fuzzled::Factory::Pattern->new(1, 10, ["\x00"]);
  while ($patternstring = $patterntesthandle->generate()) {
  	print $patternstring . "\n";
  }

=head1 DESCRIPTION

C<Fuzzled::Factory::Pattern> is a Perl extension for Fuzzled to create patterned strings.  The following methods are available:

=over 4

=item Fuzzled::Factory::Pattern->new(<minimumlength>, <currentlength>, <badcharacters>)

Constructs a new C<Fuzzled::Factory::Pattern> object describing the pattern.

=item <resultstring> = Fuzzled::Factory::Pattern->generate()

Generates a single string to fuzz the connection.

Returns the result string.

=item <resultstring> = Fuzzled::Factory::Pattern->calculate(<currentlength>, <targetstring>)

Calculates the offset to the target string.

Returns the offset to the target string or -1 on failure.

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
