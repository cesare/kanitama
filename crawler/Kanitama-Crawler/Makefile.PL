use inc::Module::Install;
name 'Kanitama-Crawler';
all_from 'lib/Kanitama/Crawler.pm';

# requires '';
requires 'DBI';
requires 'Parse::DMIDecode';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
