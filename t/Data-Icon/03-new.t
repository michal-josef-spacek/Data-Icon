use strict;
use warnings;

use Data::Icon;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Icon->new;
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
