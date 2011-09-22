#!/usr/bin/env perl

#
# Basic Accept-Language tests
#

use strict;
require test;

my @langs = qw(bg cs da fi fy hu it ja no pl ru tr vn);

Test::More::plan(tests => 7 + (@langs * 3));

test::update_binary();
test::is_lang('en', 'en');
test::is_lang('', 'en');
test::is_lang('en,xy-zx;q=0.01', 'en');
test::is_lang('en,en;q=0.99', 'en');

# Basically test for supported languages
for (@langs) {
    my $lang = $_;

    test::is_lang($lang, $lang);
    test::is_lang("$lang,xy-zx;q=0.01", $_);
    test::is_lang("$lang,en;q=0.99", join("_", sort($_,'en')));
}

test::is_lang('xy', 'en');
test::is_lang('xy-XX', 'en');
