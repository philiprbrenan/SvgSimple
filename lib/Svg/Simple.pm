#!/usr/bin/perl -I/home/phil/perl/cpan/DataTableText/lib/
#-------------------------------------------------------------------------------
# SVG overlay to facilitate writing SVG documents using Perl
# Philip R Brenan at gmail dot com, Appa Apps Ltd Inc., 2017-2020
#-------------------------------------------------------------------------------
# podDocumentation
package Svg::Simple;
require v5.34;
our $VERSION = 20231021;
use warnings FATAL => qw(all);
use strict;
use Carp qw(confess);
use Data::Dump qw(dump);
use Data::Table::Text qw(:all);

makeDieConfess;

#D1 Constructors                                                                # Construct a new SVG object

sub new(%)                                                                      # New SVG
 {my (%options) = @_;                                                           # Options
  genHash(__PACKAGE__,
    code=>[],                                                                   # Svg code generated
    mX=>0,                                                                      # Maximum X coordinate encountered
    mY=>0,                                                                      # Maximum Y coordinate encountered
  );
 }

sub print($%)                                                                   # Print resulting svg string
 {my ($svg, %options) = @_;                                                     # Svg, Options
  my $s = join "\n", $svg->code->@*;
  my $X = $svg->mX;                                                             # Maximum extent
  my $Y = $svg->mY;
  my $e = q(</svg>);
  <<END;
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
<svg height="100%" viewBox="0 0 $X $Y" width="100%" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
$s
$e
END
 }

our $AUTOLOAD;                                                                  # The method to be autoloaded appears here

sub AUTOLOAD($%)                                                                # Allow methods with constant parameters to be called as B<method_p1_p2>...(variable parameters) whenever it is easier to type underscores than (qw()).
 {my ($svg, %options) = @_;                                                     # Svg object, options
  my @s;

  for my $k(sort keys %options)                                                 # Process each option
   {my $v = $options{$k};
    my $K = $k =~ s(_) (-)r;                                                    # _ in option names becomes -
    next if $k =~ m(\Acdata\Z)i;
    push @s, qq($K="$v");
   }

  my $n = $AUTOLOAD =~ s(\A.*::) ()r;                                           # Name of element

  eval                                                                          # Maximum extent of the Svg
   {my $X = $svg->mY;
    my $Y = $svg->mY;
    if ($n =~ m(\Arectangle\Z)i)
     {$X = max $X, $options{x}+$options{width};
      $Y = max $Y, $options{y}+$options{height};
     }
    if ($n =~ m(\Acircle\Z)i)
     {$X = max $X, $options{cx}+$options{r};
      $Y = max $Y, $options{cy}+$options{r};
     }
    if ($n =~ m(\Atext\Z)i)
     {$X = max $X, $options{x} + length($options{cdata});
      $Y = max $Y, $options{y};
     }
    $svg->mX = $X;
    $svg->mY = $Y;
   };

  my $p = join " ", @s;                                                         # Options
  if (my $t = $options{cdata})
   {push $svg->code->@*, "<$n $p>$t</$n>"                                       # Internal text
   }
  else
   {push $svg->code->@*, "<$n $p/>"                                             # No internal text
   }
  $svg
 }

#D0
#-------------------------------------------------------------------------------
# Export - eeee
#-------------------------------------------------------------------------------

use Exporter qw(import);

use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

# containingFolder

@ISA          = qw(Exporter);
@EXPORT       = qw();
@EXPORT_OK    = qw();
%EXPORT_TAGS = (all=>[@EXPORT, @EXPORT_OK]);

# podDocumentation

=encoding utf-8

=head1 Name

Svg::Better - SVG overlay to facilitate writing SVG documents using Perl

=head1 Synopsis

=head1 Description

SVG overlay to facilitate writing SVG documents using Perl


Version 20231021.


The following sections describe the methods in each functional area of this
module.  For an alphabetic listing of all methods by name see L<Index|/Index>.



=head1 Constructors

Construct a new SVG object

=head2 new(%options)

New SVG

     Parameter  Description
  1  %options   Options

B<Example:>



    my $s = new();  # 𝗘𝘅𝗮𝗺𝗽𝗹𝗲

    $s->text  ( x=>10,  y=>10, cdata =>"Hello World", font_size=>4);
    $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent");
    owf fpe(qw(svg test svg)), $s->print;


=head2 print($svg, %options)

Print resulting svg string

     Parameter  Description
  1  $svg       Svg
  2  %options   Options

=head2 AUTOLOAD($svg, %options)

Allow methods with constant parameters to be called as B<method_p1_p2>...(variable parameters) whenever it is easier to type underscores than (qw()).

     Parameter  Description
  1  $svg       Svg object
  2  %options   Options


=head1 Index


1 L<AUTOLOAD|/AUTOLOAD> - Allow methods with constant parameters to be called as B<method_p1_p2>.

2 L<new|/new> - New SVG

3 L<print|/print> - Print resulting svg string

=head1 Installation

This module is written in 100% Pure Perl and, thus, it is easy to read,
comprehend, use, modify and install via B<cpan>:

  sudo cpan install Svg::Simple

=head1 Author

L<philiprbrenan@gmail.com|mailto:philiprbrenan@gmail.com>

L<http://www.appaapps.com|http://www.appaapps.com>

=head1 Copyright

Copyright (c) 2016-2023 Philip R Brenan.

This module is free software. It may be used, redistributed and/or modified
under the same terms as Perl itself.

=cut



# Tests and documentation

sub test
 {my $p = __PACKAGE__;
  binmode($_, ":utf8") for *STDOUT, *STDERR;
  return if eval "eof(${p}::DATA)";
  my $s = eval "join('', <${p}::DATA>)";
  $@ and die $@;
  eval $s;
  $@ and die $@;
  1
 }

test unless caller;

1;
# podDocumentation
#__DATA__
use Test::More tests => 1;

eval "goto latest";

if (1) {                                                                        #Tnew #Tprint
  my $s = new();
  $s->text  ( x=>10,  y=>10, cdata =>"Hello World", font_size=>4);
  $s->circle(cx=>10, cy=>10, r=>8, stroke=>"blue", fill=>"transparent");
  my $S = $s->print;
  owf fpe(qw(svg test svg)), $S;
  ok $S =~ m(circle)
 }
