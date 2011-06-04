use inc::Module::Install;

name     'Abjad';
all_from 'lib/Abjad.pm';
author   q{Seyed hadi Hosseini <im.perlish@gmail.com>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

