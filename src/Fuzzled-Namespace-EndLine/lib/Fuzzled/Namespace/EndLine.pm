# $Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Namespace-EndLine/lib/Fuzzled/Namespace/EndLine.pm,v 1.2 2012-10-30 17:00:51 timb Exp $
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
# (c) Tim Brown, 2006
# <mailto:timb@nth-dimension.org.uk>
# <http://www.nth-dimension.org.uk/> / <http://www.machine.org.uk/>

package Fuzzled::Namespace::EndLine;

use 5.008007;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use Fuzzled::Namespace::EndLine ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);

our $VERSION = ('$Header: /var/lib/cvsd/var/lib/cvsd/Fuzzled/src/Fuzzled-Namespace-EndLine/lib/Fuzzled/Namespace/EndLine.pm,v 1.2 2012-10-30 17:00:51 timb Exp $' =~ m/.Header: .* ([\d.]+) .*/)[0];

# Preloaded methods go here.

sub generate {
	return ("", "\r", "\n", "\r\n");
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Fuzzled::Namespace::EndLine - Perl extension for Fuzzled to create an array of endline characters

=head1 SYNOPSIS

  use Fuzzled::Factory::EndLine;

  my @endlinetesthandle;

  @endlinetesthandle = Fuzzled::Factory::Namespace::EndLine->generate();

=head1 DESCRIPTION

C<Fuzzled::Namespace::EndLine> is a Perl extension for Fuzzled to create an array of endline characters.  The following methods are available:

=over 4

=item <endlinearray> = Fuzzled::Namespace::EndLine->generate()

Generates an array of endline characters to fuzz the connection.

Returns the array.

=head1 SEE ALSO

=head1 AUTHOR

(c) Tim Brown, 2006
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