#!/usr/bin/env perl

use strict;
use warnings;

use Data::Icon;
use Unicode::UTF8 qw(decode_utf8 encode_utf8);

my $obj = Data::Icon->new(
        'char' => decode_utf8('†'),
        'color' => 'red',
);

# Print out.
print "Character: ".encode_utf8($obj->char)."\n";
print "CSS Color: ".$obj->color."\n";

# Output:
# Character: †
# CSS Color: red