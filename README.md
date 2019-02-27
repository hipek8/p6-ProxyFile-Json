[![Build Status](https://travis-ci.org/hipek8/p6-ProxyFile-Json.svg?branch=master)](https://travis-ci.org/hipek8/p6-ProxyFile-Json)

NAME
====

ProxyFile::JSON - save and load object to/from JSON file. Useful for quick command line tools that want to preserve state.

SYNOPSIS
========

    use ProxyFile::JSON;
    class A does ProxyFile::JSON { ... }
    my $file = "some-file.json";
    A.load($file);
    ...
    A.save($file);

DESCRIPTION
===========

ProxyFile::JSON extends JSON::Class role by providing methods to load and save to/from file.

File doesn't have to exist prior to loading or saving. If file doesn't exist default `new` constructor is called without arguments.

Some built-in types don't serialize too well so try to avoid them. Also be careful with inherited types.

AUTHOR
======

Paweł Szulc <pawel_szulc@onet.pl>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Paweł Szulc

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

