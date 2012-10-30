# $Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-Replace/lib/Fuzzled/Factory/Replace.pm,v 1.2 2012-10-30 17:00:51 timb Exp $
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

package Fuzzled::Factory::Replace;

use 5.008007;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use Fuzzled::Factory::Replace ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);

our $VERSION = ('$Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Factory-Replace/lib/Fuzzled/Factory/Replace.pm,v 1.2 2012-10-30 17:00:51 timb Exp $' =~ m/.Header: .* ([\d.]+) .*/)[0];

# Preloaded methods go here.

sub new {
	my $class;
	my $self;
	my $targetstrings;
	$class = shift;
	$self = {};
	$self = bless($self, $class);
	$self->{'startstring'} = shift;
	$targetstrings = shift;
	$self->{'targetstrings'} = $targetstrings;
	$self->{'maximumtargetstring'} = @$targetstrings;
	$self->{'replacementstring'} = shift;
	$self->{'currenttargetstring'} = 1;
	return $self;
}

sub generate {
	my $self;
	my @targetstrings;
	my $replacementstring;
	my $resultstring;
	$self = shift;
	if ($self->{'currenttargetstring'} > $self->{'maximumtargetstring'}) {
		return "";
	}
	@targetstrings = @{$self->{'targetstrings'}[($self->{'currenttargetstring'} - 1)]};
	$resultstring = $self->{'startstring'};
	$replacementstring = $targetstrings[1] . $self->{'replacementstring'};
	$resultstring =~ s/$targetstrings[0]/$replacementstring/g;
	$self->{'currenttargetstring'} ++;
	return $resultstring;
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Fuzzled::Factory::Replace - Perl extension for Fuzzled to create repeated strings

=head1 SYNOPSIS

  use Fuzzled::Factory::Replace;

  my $replacetesthandle;
  my $targetstring;

  $replacetesthandle = Fuzzled::Factory::Replace->new("GET /\n\n", [["GET", ""]], "A"x1024);
  while ($targetstring = $replacetesthandle->generate()) {
  	print $targetstring . "\n";
  }

=head1 DESCRIPTION

C<Fuzzled::Factory::Replace> is a Perl extension for Fuzzled to replace strings.  The following methods are available:

=over 4

=item Fuzzled::Factory::Replace->new(<startstring>, <targetstrings>, <replacementstring>)

Constructs a new C<Fuzzled::Factory::Replace> object describing the replacement.

=item <resultstring> = Fuzzled::Factory::Replace->generate()

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
