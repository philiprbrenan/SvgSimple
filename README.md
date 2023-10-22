# Description

SVG overlay to facilitate writing SVG documents using Perl

Version 20231021.

The following sections describe the methods in each functional area of this [module](https://en.wikipedia.org/wiki/Modular_programming).  For an alphabetic listing of all methods by name see [Index](#index).

# Constructors

Construct a new SVG object

## new(%options)

New SVG

       Parameter  Description
    1  %options   Options

**Example:**

      my $s = new();  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

      $s->text  ( x=>10,  y=>10, cdata =>"Hello World", font_size=>4);
      $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent");
      my $S = $s->print;
      owf fpe(qw(svg [test](https://en.wikipedia.org/wiki/Software_testing) svg)), $S;
      ok $S =~ m(circle)
    

## print($svg, %options)

Print resulting [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) [string](https://en.wikipedia.org/wiki/String_(computer_science)) 
       Parameter  Description
    1  $svg       Svg
    2  %options   Options

**Example:**

      my $s = new();
      $s->text  ( x=>10,  y=>10, cdata =>"Hello World", font_size=>4);
      $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent");
    
      my $S = $s->print;  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

      owf fpe(qw(svg [test](https://en.wikipedia.org/wiki/Software_testing) svg)), $S;
      ok $S =~ m(circle)
    

## AUTOLOAD($svg, %options)

Allow methods with constant parameters to be called as **method\_p1\_p2**...(variable parameters) whenever it is easier to type underscores than (qw()).

       Parameter  Description
    1  $svg       Svg object
    2  %options   Options

# Index

1 [AUTOLOAD](#autoload) - Allow methods with constant parameters to be called as **method\_p1\_p2**.

2 [new](#new) - New SVG

3 [print](#print) - Print resulting [Scalar Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) [string](https://en.wikipedia.org/wiki/String_(computer_science)) 
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

# POD ERRORS

Hey! **The above document had some coding errors, which are explained below:**

- Around line 29:

    Non-ASCII character seen before =encoding in '𝗘𝘅𝗮𝗺𝗽𝗹𝗲'. Assuming CP1252
