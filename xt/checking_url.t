use strict;
use warnings;
use Test::More;
use HTTP::Tiny;

my @definitions= glob("share/mysql-build/definitions/*");

foreach my $definition (@definitions)
{
  open(my $fh, "<", $definition) or die;

  while (my $line= <$fh>)
  {
    if ($line =~ qr|(https?://.+\.tar\.gz)|)
    {
      my $url= $1;
      is(request_head($url), 200, $definition)
    }
  }
}

done_testing;


sub request_head
{
  my ($url)= @_;

  my $ua = HTTP::Tiny->new;
  my $res= $ua->head($url);

  $res->{status};
}
