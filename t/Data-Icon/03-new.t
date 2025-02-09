use strict;
use warnings;

use Data::Icon;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::Icon->new;
isa_ok($obj, 'Data::Icon');

# Test.
$obj = Data::Icon->new(
	'alt' => 'Foo icon',
	'url' => 'https://examples.com/foo.ico',
);
isa_ok($obj, 'Data::Icon');

# Test.
$obj = Data::Icon->new(
	'bg_color' => 'grey',
	'char' => decode_utf8('†'),
	'color' => 'red',
);
isa_ok($obj, 'Data::Icon');

# Test.
eval {
	Data::Icon->new(
		'url' => 'urn:isbn:0451450523',
	);
};
is($EVAL_ERROR, "Parameter 'url' doesn't contain valid location.\n",
	"Parameter 'url' doesn't contain valid location (urn:isbn:0451450523).");
clean();
