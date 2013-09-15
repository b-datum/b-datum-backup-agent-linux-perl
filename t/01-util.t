
#!/usr/bin/perl 

use strict;
use warnings;

use Test::More tests => 3;
use FindBin qw($Bin $Script);

use bdatum::Util;

my $util = bdatum::Util->new;
$util->disable_log;

ok($util->validate_key('12345678901234567890'), 'validate key with numbers');
ok($util->validate_key('abcdefghijlmnopqrstu'), 'validate key with letters');
ok(!$util->validate_key("!@#"), "can't validate key with !@#");

ok($util->validate_path($Bin), "validate path with $Bin");
ok(!$util->validate_path("$Bin/$Script"), "can't validate path with $Bin/$Script");

1;

