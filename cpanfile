requires "Exporter" => "0";
requires "IO::Scalar" => "2.110";
requires "Pod::Spell" => "1.01";
requires "Pod::Spelling" => "0";
requires "parent" => "0";
requires "perl" => "5.006";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "File::Temp" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::More" => "0.88";
  requires "perl" => "5.006";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "Module::Build::Tiny" => "0.039";
  requires "perl" => "5.006";
};

on 'develop' => sub {
  requires "version" => "0.9901";
};
