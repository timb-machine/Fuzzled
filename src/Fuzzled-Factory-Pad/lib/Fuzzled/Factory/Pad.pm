# $Revision$
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

package Fuzzled::Factory::Pad;

use 5.008007;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use Fuzzled::Factory::Pad ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);

our $VERSION = ('$Revision$' =~ m/.Revision: .* ([\d.]+) .*/)[0];

# Preloaded methods go here.

sub new {
	my $class;
	my $self;
	$class = shift;
	$self = {};
	bless($self, $class);
	$self->{'startstring'} = shift;
	$self->{'padstring'} = shift;
	$self->{'maximumlength'} = shift;
	$self->{'currentlength'} = length($self->{'startstring'});
	return $self;
}

sub generate {
	my $self;
	my $resultstring;
	$self = shift;
	if ($self->{'currentlength'} > $self->{'maximumlength'}) {
		return "";
	}
	$resultstring = ($self->{'padstring'} x ($self->{'currentlength'} - length($self->{'startstring'}))) . $self->{'startstring'} ;
	$self->{'currentlength'} ++;
	return $resultstring;
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Fuzzled::Factory::Pad - Perl extension for Fuzzled to create padded strings

=head1 SYNOPSIS

  use Fuzzled::Factory::Pad;

  my $padtesthandle;
  my $padstring;

  $padtesthandle = Fuzzled::Factory::Pad->new("1", "0", 10);
  while ($padstring = $padtesthandle->generate()) {
  	print $padstring . "\n";
  }

=head1 DESCRIPTION

C<Fuzzled::Factory::Pad> is a Perl extension for Fuzzled to create padded strings.  The following methods are available:

=over 4

=item Fuzzled::Factory::Pad->new(<startstring>, <padstring>, <maximumlength>)

Constructs a new C<Fuzzled::Factory::Pad> object describing the separation.

=item <resultstring> = Fuzzled::Factory::Pad->generate()

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