#!/usr/bin/env perl

#
# Accept-Language sort-related tests
#

use strict;
require test;

my @tests = (
    [ 'xy,en;q=0.2,ru;q=0.9', 'en_ru' ],
    [ 'xy,en;q=0.97,ru;q=0.98,it;q=0.99', 'en_it_ru' ],
    [ 'ru-RU,ru;q=0.9,en;q=0.8', 'en_ru' ],
    [ '', 'en' ],
    [ 'en-us,en;q=0.9', 'en' ],
    [ 'en-US,en;q=0.9', 'en' ],
    [ 'ru,en;q=0.9', 'en_ru' ],
    [ '*,uk;q=0.2,fr;q=0.1', 'uk', 'Wildcard * should be last one' ],
);

Test::More::plan(tests => @tests + 1);
test::update_binary();

for (@tests) {
    my ($header, $lang, $message) = @{ $_ };
    test::is_lang($header, $lang, $message);
}

