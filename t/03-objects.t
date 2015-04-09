#!perl

use strict;
use warnings;
use Test::More;
use Test::Deep;

use JSON::Meth;
use JSON::MaybeXS;

package TestObj;
use overload q{""} => sub { '["foo","bar","baz"]' };
sub TO_JSON { '42' }

package TestObj2;
use overload q{""} => sub { '["foo","bar","baz"]' };

package main;

my $obj  = bless {}, 'TestObj';
my $obj2 = bless {}, 'TestObj2';

cmp_deeply(
    $obj2->$j,
    [qw/foo bar baz/],
    q{root object that have overloaded stringification},
);

cmp_deeply(
    $obj->$j,
    [qw/foo bar baz/],
    q{root object that has overloaded stringification and has TO_JSON},
);

cmp_deeply(
    { foo => $obj }->$j->$j,
    { foo => 42 },
    q{objects within our data structure that implement TO_JSON},
);

cmp_deeply(
    { foo => $obj2 }->$j->$j,
    { foo => undef },
    q{objects within our data structure that do NOT implement TO_JSON},
);

done_testing();

__END__