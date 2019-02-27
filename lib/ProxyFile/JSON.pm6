use v6.c;
use JSON::Class;

unit role ProxyFile::JSON does JSON::Class;

multi method save(Str $file) {
	return self.save($file.IO);
}

multi method save(IO::Path $file) {
	return $file.spurt: self.to-json;
}


multi method load(Str $file) {
	return self.load($file.IO);
}

multi method load(IO::Path $file) {
	return $file.e
		?? return self.from-json($file.IO.slurp)
		!! return self.new
	;
}

=begin pod

=head1 NAME

ProxyFile::JSON - save and load object to/from JSON file. Useful for quick command line tools that want to preserve state.

=head1 SYNOPSIS

  use ProxyFile::JSON;
  class A does ProxyFile::JSON { ... }
  my $file = "some-file.json";
  A.load($file);
  ...
  A.save($file);

=head1 DESCRIPTION

ProxyFile::JSON extends JSON::Class role by providing methods to load and save to/from file.

File doesn't have to exist prior to loading or saving. If file doesn't exist default `new` constructor is called without arguments.

Some built-in types don't serialize too well so try to avoid them. Also be careful with inherited types.

=head1 AUTHOR

Paweł Szulc <pawel_szulc@onet.pl>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Paweł Szulc

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
