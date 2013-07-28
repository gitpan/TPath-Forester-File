
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "L<TPath::Forester> that understands file systems",
  "AUTHOR" => "David F. Houghton <dfhoughton\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "TPath-Forester-File",
  "EXE_FILES" => [
    "bin/tfind",
    "bin/tfind"
  ],
  "LICENSE" => "perl",
  "NAME" => "TPath::Forester::File",
  "PREREQ_PM" => {
    "Cwd" => 0,
    "Encode" => 0,
    "Encode::Detect::Detector" => 0,
    "Fcntl" => 0,
    "File::Spec" => 0,
    "File::stat" => 0,
    "Getopt::Long::Descriptive" => 0,
    "Module::Load::Conditional" => 0,
    "Moose" => 0,
    "Moose::Exporter" => 0,
    "Moose::Role" => 0,
    "MooseX::MethodAttributes::Role" => 0,
    "Pod::Usage" => 0,
    "TPath" => "0.016",
    "TPath::Forester" => 0,
    "TPath::Index" => 0,
    "filetest" => 0,
    "namespace::autoclean" => 0,
    "overload" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => 0,
    "Exporter" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Test::More" => "0.88",
    "Test::Script" => "1.05",
    "autodie" => 0,
    "base" => 0,
    "lib" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



