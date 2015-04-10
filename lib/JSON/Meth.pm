package JSON::Meth;

use strict;
use warnings;

# VERSION

use JSON::MaybeXS;
use Carp;
use Scalar::Util qw/blessed/;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($j);
our @EXPORT_OK = qw($json);

my $data;

use overload q{""}  => sub { $data },
             q{@{}} => sub { $data },
             q{%{}} => sub { $data };

our ( $json, $j );
$json = $j = bless sub {
    my $in = shift;

    my $json = JSON::MaybeXS->new(
        convert_blessed => 1,
        allow_blessed   => 1,
    );

    # plain data or object at root; just encode it
    return $data = $json->decode($in)
        if not ref $in
            or ( blessed $in and blessed $in ne 'JSON::Meth' );

    return $data = $json->encode($in)
        unless ref $in eq 'JSON::Meth';

    # if we got up to here, then we're dealing with a $j->$j call

    defined $data
    or croak 'You tried to call $j->$j, but $j does not have any data '
        . ' stored. You need at least one encode/decode call prior to '
        . ' this, for $j->$j to work.';

    return $data = $json->decode($data)
        unless ref $data;

    return $data = $json->encode($data);
}, 'JSON::Meth';

q{
    Q: How many programmers does it take to change a light bulb?
    A: None. It's a hardware problem.
};

__END__

=encoding utf8

=for stopwords Znet Zoffix JSON  postfix  ing

=head1 NAME

JSON::Meth - no nonsense JSON encoding/decoding as method calls on data

=head1 SYNOPSIS

=for pod_spiffy start code section

=for test_synopsis use feature 'say';

    use JSON::Meth;

    # encode JSON:
    my $json_string = { my => 'data', foo => [ 'bar' ] }->$j;

    # decode JSON
    my $perl_structure = '["look","ma!","no","vars"]'->$j;

    # encode and interpolate $j in a string to get the result
    { my => 'data' }->$j;
    say "Look ma, JSON: $j";

    # decode and grab a piece of data, as if $j were a hashref:
    my $data = '{"my":"data"}'->$j->{my}; # $data contains string "data" now

    # just pretend $j is an arrayref:
    '["woo","hoo!"]'->$j;
    say for @$j;

    # go nuts! (outputs JSON string '["bar",{"ber":"beer"}]')
    say '{"foo":["bar",{"ber":"beer"}]}'->$j->{foo}->$j;

    # event this works!! Meth? Not even once!
    say '["woo","hoo!"]'->$j->$j->$j->$j;

=for pod_spiffy end code section

=head1 DESCRIPTION

Don't make me think and give me what I want! This module automatically
figures out whether you want to encode a Perl data structure to JSON
or decode a JSON string to a Perl data structure.

The name C<JSON::Meth> is formed from
C<B<Meth>od>, which is the distinctive feature of this module.

=head1 EXPORTS

=head2 C<$j> variable

The module exports a single variable C<$j>. To encode/decode JSON,
simply make a method call on your data, with C<$j> as
the name of the method (see SYNOPSIS and THE MAGIC sections).

=head2 C<$json> variable

    use JSON::Meth '$json';

An alias to C<$j> that is exported upon request (C<$j> won't be
exported in this case, unless you ask for it too). Use this if you
want to make your code more readable.

=head1 THE MAGIC

The result of the last decode/encode operation is stored internally
by the module and you can access that data by using C<$j> variable
as if it contained that result. To get the results of B<encode> operation,
simply stringify C<$j> (e.g. by interpolating it: C<"$j">).

=head1 PREFIX/POSTFIX

If you're not a fan of postfix decoding, just use C<$j> as a prefix call:

    # encode JSON:
    my $json_string = $j->( { my => 'data', foo => [ 'bar' ] } );

    # decode JSON
    my $perl_structure = $j->( '["look","ma!","no","vars"]' );

=for pod_spiffy hr

=head1 CAVEATS

The way this module deals with encoding objects is thusly:

=over 4

=item * if you're calling C<< ->$j >> on an object, it needs to
implement stringification L<overload>ing and what it stringifies to
will be decoded.

=item * if you have an object somewhere inside a data structure you're
encoding: if
it implements C<TO_JSON> method, that method will be called, and the data
returned used as json string to replace the object; if it doesn't
implement such a method, it will be replaced with C<null>

=back

=head1 SEE ALSO

For more full-featured encoders, see L<JSON::MaybeXS>,
L<Mojo::JSON>, or L<Mojo::JSON::MaybeXS>.

=for pod_spiffy hr

=head1 REPOSITORY

=for pod_spiffy start github section

Fork this module on GitHub:
L<https://github.com/zoffixznet/JSON-Meth>

=for pod_spiffy end github section

=head1 BUGS

=for pod_spiffy start bugs section

To report bugs or request features, please use
L<https://github.com/zoffixznet/JSON-Meth/issues>

If you can't access GitHub, you can email your request
to C<bug-json-meth at rt.cpan.org>

=for pod_spiffy end bugs section

=head1 AUTHOR

=for pod_spiffy start author section

=for pod_spiffy author ZOFFIX

=for pod_spiffy end author section

=head1 LICENSE

You can use and distribute this module under the same terms as Perl itself.
See the C<LICENSE> file included in this distribution for complete
details.

=cut