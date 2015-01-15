use strict;
use warnings;
use Test::More;
use HTTP::Tiny;
use File::Basename;

my @definitions = glob(dirname(__FILE__)."/../share/mysql-build/definitions/*");

for my $definition (@definitions) {
    open(my $fh, "<", $definition) or die;

    while (my $line = <$fh>) {
        if ($line =~ qr|(?<url>https?://.+\.tar\.gz)|) {
            is request_head($+{url}), 200, $definition;
        }
    }
}

done_testing;

sub request_head {
    my $url = shift;

    my $ua = HTTP::Tiny->new;
    my $res = $ua->head($url);

    $res->{status};
}
