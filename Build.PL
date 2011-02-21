
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Catches common typos in POD',
  'dist_author' => [
    'Apocalypse <APOCAL@cpan.org>'
  ],
  'dist_name' => 'Pod-Spell-CommonMistakes',
  'dist_version' => '1.000',
  'license' => 'perl',
  'module_name' => 'Pod::Spell::CommonMistakes',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Exporter' => '0',
    'IO::Scalar' => '2.110',
    'Pod::Spell' => '1.01',
    'perl' => '5.008'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
