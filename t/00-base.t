#!/usr/bin/perl 

use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok("bdatum::Util");
    use_ok("bdatum::Constants");
}

diag("Testing all used modules");

done_testing();

1;

