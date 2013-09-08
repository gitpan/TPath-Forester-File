use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.021

use Test::More 0.88;



my @module_files = (
    'TPath/Forester/File.pm',
    'TPath/Forester/File/Attributes.pm',
    'TPath/Forester/File/Index.pm',
    'TPath/Forester/File/Node.pm'
);

my @scripts = (
    'bin/tfind'
);

# no fake home requested

use IPC::Open3;
use IO::Handle;
use File::Spec;

my @warnings;
for my $lib (@module_files)
{
    open my $stdout, '>', File::Spec->devnull or die $!;
    open my $stdin, '<', File::Spec->devnull or die $!;
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, $stdout, $stderr, qq{$^X -Mblib -e"require q[$lib]"});
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (my @_warnings = <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}

use Test::Script 1.05;
foreach my $file ( @scripts ) {
    script_compiles( $file, "$file compiles" );
}


is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;