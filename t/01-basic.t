use v6.c;
use Test;
use ProxyFile::JSON;

class B {
	has $.x;
	has Date $.y;
}
class A does ProxyFile::JSON {
	has $.a;
	has B $.b;
}

my $b = B.new: x => "hey", y => Date.new("2018-12-06");
my $a = A.new: :13a, :$b;
$a.save("file.json");
my $a2 = A.load("file.json");
is $a2.a, 13;
is $a2.b.x, "hey";
is $a2.b.y.day, 6;
"file.json".IO.unlink;
