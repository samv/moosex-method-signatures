use strict;
use warnings;
use Test::More tests => 9;
use Test::Exception;

use FindBin;
use lib "$FindBin::Bin/lib";

use TestClass;

dies_ok(sub {
    TestClass->new;
});

my $o = TestClass->new('foo');
isa_ok($o, 'TestClass');

is($o->{foo}, 'foo');
is($o->{bar}, 42);

lives_ok(sub {
    $o->set_bar(23);
});
is($o->{bar}, 23);

dies_ok(sub {
    $o->set_bar('bar');
});

lives_ok(sub {
    $o->affe({ foo => 1 });
});

lives_ok(sub {
    $o->affe([qw/a b c/]);
});

dies_ok(sub {
    $o->affe('foo');
});
