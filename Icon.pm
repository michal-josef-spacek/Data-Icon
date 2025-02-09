package Data::Icon;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is);
use Mo::utils 0.05 qw(check_length);
use Mo::utils::CSS 0.03 qw(check_css_color);
use Mo::utils::URI 0.02 qw(check_location);

our $VERSION = 0.01;

has alt => (
	is => 'ro',
);

has char => (
	is => 'ro',
);

has color => (
	is => 'ro',
);

has url => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check alt.
	check_length($self, 'alt', 100);

	# Check char.
	check_length($self, 'char', 1);

	# Check color.
	check_css_color($self, 'color');

	# Check url.
	check_location($self, 'url');
	# TODO Check image

	if (defined $self->{'char'} && defined $self->{'url'}) {
		err "Parameter 'url' is in conflict with parameter 'char'.";
	}

	if (defined $self->{'char'} && defined $self->{'alt'}) {
		err "Parameter 'char' don't need parameter 'alt'.";
	}

	if (defined $self->{'url'} && defined $self->{'color'}) {
		err "Parameter 'url' don't need parameter 'color'.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::Icon - Data object for icon.

=head1 SYNOPSIS

 use Data::Icon;

 my $obj = Data::Icon->new(%params);
 my $alt = $obj->alt;
 my $char = $obj->char;
 my $color = $obj->color;
 my $url = $obj->url;

=head1 METHODS

=head2 C<new>

 my $obj = Data::Icon->new(%params);

Constructor.

=over 8

=item * C<alt>

Alternate text for image icon.

It's optional.

=item * C<char>

Icon character. Could be UTF-8 character. Only one character.

It's optional.

=item * C<color>

Character color.

It's optional.

=item * C<url>

Icon URL.

It's optional.

=back

Returns instance of object.

=head2 C<alt>

 my $alt = $obj->alt;

Get alternate text for image icon.

Returns string.

=head2 C<char>

 my $char = $obj->char;

Get icon character.

Returns string.

=head2 C<color>

 my $color = $obj->color;

Get character color.

Returns CSS color string.

=head2 C<url>

 my $url = $obj->url;

Get icon URL.

Returns string.

=head1 ERRORS

 new():
         Parameter 'char' don't need parameter 'alt'.
         Parameter 'url' don't need parameter 'color'.
         Parameter 'url' is in conflict with parameter 'char'.
         From Mo::utils:
                 Parameter 'alt' has length greater than '100'.
                         Value: %s
                 Parameter 'char' has length greater than '1'.
                         Value: %s
         From Mo::utils::CSS::check_css_color():
                 Parameter '%s' has bad color name.
                         Value: %s
                 Parameter '%s' has bad rgb color (bad hex number).
                         Value: %s
                 Parameter '%s' has bad rgb color (bad length).
                         Value: %s
         From Mo::utils::URI::check_location():
                 Parameter 'url' doesn't contain valid location.
                         Value: %s

=head1 EXAMPLE

=for comment filename=create_icon_object_and_print.pl

 use strict;
 use warnings;

 use Data::Icon;

 my $obj = Data::InfoBox::Item->new(
         'alt' => 'Foo icon',
         'url' => 'https://example.com/foo.png',
 );

 # Print out.
 print "Alternate text: ".$obj->alt."\n";
 print "Icon URL: ".$obj->url."\n";

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
L<Mo::utils>,
L<Mo::utils::CSS>,
L<Mo::utils::URI>.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Data-Icon>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2025 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
