#!/opt/exp/perl/bin/perl -w


$| = 1;  # avoid buffering problems

my $cgi_text = "/home/alawint/lib/apache/cgi-bin/nonsense";

open(TEXTFL, "<$cgi_text") or die, "Couldn't get at the nonsense file!";

while(<TEXTFL>){
	print;
}
