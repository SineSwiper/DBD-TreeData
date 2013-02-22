
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "DBI driver for any abstract hash/array tree",
  "AUTHOR" => "Brendan Byrd <BBYRD\@CPAN.org>",
  "BUILD_REQUIRES" => {
    "Test::CheckDeps" => "0.002",
    "Test::More" => "0.88",
    "Test::UseAllModules" => "0.10"
  },
  "CONFIGURE_REQUIRES" => {},
  "DISTNAME" => "DBD-TreeData",
  "EXE_FILES" => [],
  "LICENSE" => "artistic_2",
  "NAME" => "DBD::TreeData",
  "PREREQ_PM" => {
    "DBD::AnyData" => 0,
    "DBI" => 0,
    "Data::Dumper" => "2.122",
    "Lingua::EN::Inflect::Phrase" => "0.01",
    "List::MoreUtils" => "0.23",
    "List::Util" => "1.20",
    "Scalar::Util" => "1.20",
    "parent" => "0.220",
    "sanity" => "0.91"
  },
  "VERSION" => "0.90",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


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



