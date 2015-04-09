#!perl

use strict;
use warnings;
use 5.010;
use lib qw{lib ../lib};

use JSON::Meth;

my $data = {
    foo => 'bar',
    baz => 'ber',
    mer => [
        meer => 1,
        moor => {
            meh => 'hah',
            hih => [
                'hoh',
                undef,
                0,
            ]
        },
    ],
};

my $json_str = $data->$j;

say "Our encoded JSON is $json_str";

my $same_data = $json_str->$j; # $same_data is now the same as $data


__END__