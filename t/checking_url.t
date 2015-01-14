use Test::More;
use LWP::UserAgent;

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

  my $ua = LWP::UserAgent->new();
  my $req= HTTP::Request->new(HEAD => $url);
  my $res= $ua->request($req);

  return $res->code;
}
