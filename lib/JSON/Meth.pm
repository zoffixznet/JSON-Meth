package JSON::Meth;

use strict;
use warnings;

# VERSION

use JSON::MaybeXS;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($j);

our $j = sub { ref $_[0] ? encode_json $_[0] : decode_json $_[0] };

q{
    Q: How many programmers does it take to change a light bulb?
    A: None. It's a hardware problem.
};

__END__

=encoding utf8

=for stopwords Znet Zoffix JSON  postfix

=head1 NAME

JSON::Meth - no-nonsense JSON encoding/decoding as method calls on data

=head1 SYNOPSIS

=for pod_spiffy start code section

    use JSON::Meth;

    # encode JSON:
    my $json_string = { my => 'data', foo => [ 'bar' ] }->$j;

    # decode JSON
    my $perl_structure = '["look","ma!","no","vars"]'->$j;

=for pod_spiffy end code section

=head1 DESCRIPTION

Don't make me think and give me what I want! This module automatically
figures out whether you want to encode a Perl data structure to JSON
or decode a JSON string to a Perl data structure.

=head1 EXPORTS

=head2 C<$j> variable

The module exports a single variable C<$j>. To encode/decode JSON,
simply make a method call on your data, with C<$j> as
the name of the method (see SYNOPSIS).

=head1 PREFIX/POSTFIX

If you're not a fan of postfix decoding, just use C<$j> as a prefix call:

    # encode JSON:
    my $json_string = $j->( { my => 'data', foo => [ 'bar' ] } );

    # decode JSON
    my $perl_structure = $j->( '["look","ma!","no","vars"]' );

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