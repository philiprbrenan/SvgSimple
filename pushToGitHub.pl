#!/usr/bin/perl -I/home/phil/perl/cpan/DataTableText/lib/ -I/home/phil/perl/cpan/GitHubCrud/lib/
#-------------------------------------------------------------------------------
# Push SvgSimple to GitHub
# Philip R Brenan at gmail dot com, Appa Apps Ltd Inc., 2020
#-------------------------------------------------------------------------------
use warnings FATAL => qw(all);
use strict;
use Carp;
use Data::Dump qw(dump);
use Data::Table::Text qw(:all);
use GitHub::Crud qw(:all);
use Pod::Markdown;
use feature qw(say current_sub);

my $home  = q(/home/phil/perl/cpan/SvgSimple/);                                 # Local files
my $user  = q(philiprbrenan);                                                   # User
my $repo  = q(SvgSimple);                                                       # Repo
my $wf    = q(.github/workflows/main.yml);                                      # Work flow

sub pod($$)                                                                     # Write pod file
 {my ($in, $out) = @_;                                                          # Input, output file
  my $d = updateDocumentation readFile $in;
  my $p = Pod::Markdown->new;
  my $m;
     $p->output_string(\$m);
     $p->parse_string_document($d);                                             # Create Pod and convert to markdown
     owf($out, $m);                                                             # Write markdown
 }

if (1)                                                                          # Documentation from pod to markdown into read me with well known words expanded
 {pod fpf($home, q(lib/Svg/Simple.pm)), fpf($home, q(README.md2));

  expandWellKnownWordsInMarkDownFile
    fpe($home, qw(README md2)), my $r = fpe $home, qw(README md);
 }

push my @files, searchDirectoryTreesForMatchingFiles($home, qw(.md .pl .pm));   # Files

#lll "AAAA", dump(\@files); exit;

for my $s(@files)                                                               # Upload each selected file
 {next if $s =~ m(/build/)i;
  my $p = readFile($s);                                                         # Load file
  my $t = swapFilePrefix $s, $home;
  my $w = writeFileUsingSavedToken($user, $repo, $t, $p);
  lll "$w $s $t";
 }

if (1)
 {my $d = dateTimeStamp;
  my $y = <<"END";
# Test $d

name: Test

on:
  push

jobs:

  test:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v3
      with:
        ref: 'main'

    - uses: actions/checkout\@v3
      with:
        repository: philiprbrenan/DataTableText
        path: dtt

    - name: Cpan
      run:  sudo cpan install -T Data::Dump
    - name: Ubuntu update
      run:  sudo apt update

    - name: Test Perl
      run:
        perl -Ilib Svg/Simple.pm
END

  my $f = writeFileUsingSavedToken $user, $repo, $wf, $y;                       # Upload workflow
  lll "Ubuntu work flow for $repo written to: $f";
 }
