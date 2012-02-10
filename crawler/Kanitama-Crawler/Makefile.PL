use inc::Module::Install;
name 'Kanitama-Crawler';
all_from 'lib/Kanitama/Crawler.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
