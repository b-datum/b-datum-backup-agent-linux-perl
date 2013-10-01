#!/usr/bin/perl 

use strict;
use warnings;

use Test::More tests => 10;
use FindBin qw($Bin $Script);

use bdatum::Util;

my $util = bdatum::Util->new;
$util->disable_log;

ok($util->validate_key('12345678901234567890'), 'validate key with numbers');
ok($util->validate_key('abcdefghijlmnopqrstu'), 'validate key with letters');
ok(!$util->validate_key("!@#"), "can't validate key with !@#");

ok($util->validate_path($Bin), "validate path with $Bin");
ok(!$util->validate_path("$Bin/$Script"), "can't validate path with $Bin/$Script");

ok(!$util->make_control_file('foo'), "Try to set control_file without partner key, node key and path");

ok($util->set_partner_key('12345678901234567890'), "Set partner key to 12345678901234567890");
ok($util->set_node_key('12345678901234567890'), "Set node key to 12345678901234567890");
ok($util->set_path('/test'), "Set path for /test");

like($util->make_control_file('foo'), qr|\.b-datum/ffe82773b7640219825e5058f743326f\.foo$|, "Make controle_file with partner key, node key and path");

1;

