use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.010

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
lib/TPath/Forester/File.pm
lib/TPath/Forester/File/Attributes.pm
lib/TPath/Forester/File/Index.pm
lib/TPath/Forester/File/Node.pm
);

my @scripts = qw(
bin/tfind
);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require qq[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}

is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};

use Test::Script 1.05;
foreach my $file ( @scripts ) {
    script_compiles( $file, "$file compiles" );
}




done_testing;
