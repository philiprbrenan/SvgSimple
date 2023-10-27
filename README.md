# Name

Svg::Simple - Write [svg](https://metacpan.org/pod/svg) using Perl syntax.

# Synopsis

Svg::Simple makes it easy to write [svg](https://metacpan.org/pod/svg) using Perl syntax as in:

    my $s = Svg::Simple::new();

    $s->text(x=>10, y=>10,
      cdata             =>"Hello World",
      text_anchor       =>"middle",
      alignment_baseline=>"middle",
      font_size         => 3.6,
      font_family       =>"Arial",
      fill              =>"black");

    $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent", opacity=>0.5);

    say STDERR $s->print;

<div>
    <img src="https://raw.githubusercontent.com/philiprbrenan/SvgSimple/main/lib/Svg/svg/test.svg">
</div>

A **-** in an [svg](https://metacpan.org/pod/svg) keyword can be replaced with **\_** to reduce line noise.

The [print](https://metacpan.org/pod/print) method automatically creates an [svg](https://metacpan.org/pod/svg) to wrap around all the
[svg](https://metacpan.org/pod/svg) statements specified.  The image so created will fill all of the
available space in the [web browser](https://en.wikipedia.org/wiki/Web_browser) if the image is shown by itself, else it will
fill all of the available space in the parent tag containing the [svg](https://metacpan.org/pod/svg)
statements if the [svg](https://metacpan.org/pod/svg) is inlined in [html](https://metacpan.org/pod/html) .

This package automatically tracks the dimensions of the objects specified in
the [svg](https://metacpan.org/pod/svg) statements and creates a viewport wide enough and high enough to
display them fully in whatever space the [web browser](https://en.wikipedia.org/wiki/Web_browser) allocates to the [svg](https://metacpan.org/pod/svg) image.

If you wish to set these dimensions yourself, call the [print](https://metacpan.org/pod/print) method with
overriding values as in:

    say STDERR $s->print(width=>2000, height=>1000);

If you wish to inline the generated [html](https://metacpan.org/pod/html) you should remove the first two lines
of the generated [code](https://en.wikipedia.org/wiki/Computer_program) using a regular expression to remove the superfluous [xml](https://metacpan.org/pod/xml)
headers.

# Description

Write [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) using Perl syntax.

Version 20231026.

The following sections describe the methods in each functional area of this [module](https://en.wikipedia.org/wiki/Modular_programming).  For an alphabetic listing of all methods by name see [Index](#index).

# Constructors

Construct and print a new [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) object.

## new(%options)

Create a new [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) object.

       Parameter  Description
    1  %options   Svg options

**Example:**

      my $s = Svg::Simple::new();  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

    
      $s->text(x=>10, y=>10,
        cdata             =>"Hello World",
        text_anchor       =>"middle",
        alignment_baseline=>"middle",
        font_size         => 3.6,
        font_family       =>"Arial",
        fill              =>"black");
    
      $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent", opacity=>0.5);
      my $f = owf fpe(qw(svg [test](https://en.wikipedia.org/wiki/Software_testing) svg)), $s->print(width=>20, height=>20);
      ok($s->print =~ m(circle));
    

## print($svg, %options)

Print resulting [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) [string](https://en.wikipedia.org/wiki/String_(computer_science)). 
       Parameter  Description
    1  $svg       Svg
    2  %options   Svg options

**Example:**

      my $s = Svg::Simple::new();
    
      $s->text(x=>10, y=>10,
        cdata             =>"Hello World",
        text_anchor       =>"middle",
        alignment_baseline=>"middle",
        font_size         => 3.6,
        font_family       =>"Arial",
        fill              =>"black");
    
      $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent", opacity=>0.5);
    
      my $f = owf fpe(qw(svg [test](https://en.wikipedia.org/wiki/Software_testing) svg)), $s->print(width=>20, height=>20);  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

    
      ok($s->print =~ m(circle));  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

    

# Private Methods

## AUTOLOAD($svg, %options)

[Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) methods.

       Parameter  Description
    1  $svg       Svg object
    2  %options   Options

# Index

1 [AUTOLOAD](#autoload) - [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) methods.

2 [new](#new) - Create a new [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) object.

3 [print](#print) - Print resulting [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) [string](https://en.wikipedia.org/wiki/String_(computer_science)). 
# Installation

This [module](https://en.wikipedia.org/wiki/Modular_programming) is written in 100% Pure Perl and, thus, it is easy to read,
comprehend, use, modify and [install](https://en.wikipedia.org/wiki/Installation_(computer_programs)) via **cpan**:

    sudo [CPAN](https://metacpan.org/author/PRBRENAN) [install](https://en.wikipedia.org/wiki/Installation_(computer_programs)) Svg::Simple

# Author

[philiprbrenan@gmail.com](mailto:philiprbrenan@gmail.com)

[http://www.appaapps.com](http://www.appaapps.com)

# Copyright

Copyright (c) 2016-2023 Philip R Brenan.

This [module](https://en.wikipedia.org/wiki/Modular_programming) is free software. It may be used, redistributed and/or modified
under the same terms as Perl itself.
