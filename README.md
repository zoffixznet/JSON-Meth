# NAME

JSON::Meth - no-nonsense JSON encoding/decoding as method calls on data

# SYNOPSIS

<div>
    <div style="display: table; height: 91px; background: url(http://zoffix.com/CPAN/Dist-Zilla-Plugin-Pod-Spiffy/icons/section-code.png) no-repeat left; padding-left: 120px;" ><div style="display: table-cell; vertical-align: middle;">
</div>

    use JSON::Meth;

    # encode JSON:
    my $json_string = { my => 'data', foo => [ 'bar' ] }->$j;

    # decode JSON
    my $perl_structure = '["look","ma!","no","vars"]'->$j;

<div>
    </div></div>
</div>

# DESCRIPTION

Don't make me think and give me what I want! This module automatically
figures out whether you want to encode a Perl data structure to JSON
or decode a JSON string to a Perl data structure.

# EXPORTS

## `$j` variable

The module exports a single variable `$j`. To encode/decode JSON,
simply make a method call on your data, with `$j` as
the name of the method (see SYNOPSIS).

# PREFIX/POSTFIX

If you're not a fan of postfix decoding, just use `$j` as a prefix call:

    # encode JSON:
    my $json_string = $j->( { my => 'data', foo => [ 'bar' ] } );

    # decode JSON
    my $perl_structure = $j->( '["look","ma!","no","vars"]' );

<div>
    <div style="background: url(http://zoffix.com/CPAN/Dist-Zilla-Plugin-Pod-Spiffy/icons/hr.png);height: 18px;"></div>
</div>

# REPOSITORY

<div>
    <div style="display: table; height: 91px; background: url(http://zoffix.com/CPAN/Dist-Zilla-Plugin-Pod-Spiffy/icons/section-github.png) no-repeat left; padding-left: 120px;" ><div style="display: table-cell; vertical-align: middle;">
</div>

Fork this module on GitHub:
[https://github.com/zoffixznet/JSON-Meth](https://github.com/zoffixznet/JSON-Meth)

<div>
    </div></div>
</div>

# BUGS

<div>
    <div style="display: table; height: 91px; background: url(http://zoffix.com/CPAN/Dist-Zilla-Plugin-Pod-Spiffy/icons/section-bugs.png) no-repeat left; padding-left: 120px;" ><div style="display: table-cell; vertical-align: middle;">
</div>

To report bugs or request features, please use
[https://github.com/zoffixznet/JSON-Meth/issues](https://github.com/zoffixznet/JSON-Meth/issues)

If you can't access GitHub, you can email your request
to `bug-json-meth at rt.cpan.org`

<div>
    </div></div>
</div>

# AUTHOR

<div>
    <div style="display: table; height: 91px; background: url(http://zoffix.com/CPAN/Dist-Zilla-Plugin-Pod-Spiffy/icons/section-author.png) no-repeat left; padding-left: 120px;" ><div style="display: table-cell; vertical-align: middle;">
</div>

<div>
    <span style="display: inline-block; text-align: center;"> <a href="http://metacpan.org/author/ZOFFIX"> <img src="http://www.gravatar.com/avatar/328e658ab6b08dfb5c106266a4a5d065?d=http%3A%2F%2Fwww.gravatar.com%2Favatar%2F627d83ef9879f31bdabf448e666a32d5" alt="ZOFFIX" style="display: block; margin: 0 3px 5px 0!important; border: 1px solid #666; border-radius: 3px; "> <span style="color: #333; font-weight: bold;">ZOFFIX</span> </a> </span>
</div>

<div>
    </div></div>
</div>

# LICENSE

You can use and distribute this module under the same terms as Perl itself.
See the `LICENSE` file included in this distribution for complete
details.
