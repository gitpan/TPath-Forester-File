use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

# List our own version used to generate this
my $v = "\nGenerated by Dist::Zilla::Plugin::ReportVersions::Tiny v1.09\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = 'v5.10.0';
    $v .= "perl: $] (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('Capture::Tiny','any version') };
eval { $v .= pmver('Cwd','any version') };
eval { $v .= pmver('Encode','any version') };
eval { $v .= pmver('Encode::Detect::Detector','any version') };
eval { $v .= pmver('Exporter','any version') };
eval { $v .= pmver('ExtUtils::MakeMaker','6.30') };
eval { $v .= pmver('Fcntl','any version') };
eval { $v .= pmver('File::Path','any version') };
eval { $v .= pmver('File::Spec','any version') };
eval { $v .= pmver('File::Temp','any version') };
eval { $v .= pmver('File::stat','any version') };
eval { $v .= pmver('FindBin','any version') };
eval { $v .= pmver('Getopt::Long::Descriptive','any version') };
eval { $v .= pmver('Module::Load::Conditional','any version') };
eval { $v .= pmver('Moose','any version') };
eval { $v .= pmver('Moose::Exporter','any version') };
eval { $v .= pmver('Moose::Role','any version') };
eval { $v .= pmver('MooseX::MethodAttributes::Role','any version') };
eval { $v .= pmver('Pod::Usage','any version') };
eval { $v .= pmver('TPath','0.016') };
eval { $v .= pmver('TPath::Forester','any version') };
eval { $v .= pmver('TPath::Index','any version') };
eval { $v .= pmver('Test::More','0.88') };
eval { $v .= pmver('Test::Script','1.05') };
eval { $v .= pmver('autodie','any version') };
eval { $v .= pmver('base','any version') };
eval { $v .= pmver('filetest','any version') };
eval { $v .= pmver('lib','any version') };
eval { $v .= pmver('namespace::autoclean','any version') };
eval { $v .= pmver('overload','any version') };
eval { $v .= pmver('strict','any version') };
eval { $v .= pmver('version','0.9901') };
eval { $v .= pmver('warnings','any version') };


# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve your problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
