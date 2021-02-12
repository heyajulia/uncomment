#/usr/bin/env perl

use strict;
use warnings;

use Fcntl qw(SEEK_SET);

foreach my $file (@ARGV) {
    open(my $fd, "+<", $file) or die $!;

    my $stripped = "";

    foreach my $line (<$fd>) {
        next if $line =~ /\/\/[<>].*/;

        if (index($line, "/*") != -1) {
            next while index($line, "*/") == -1;
        }

        next if index($line, "*/") != -1;

        $stripped .= $line;
    }

    seek($fd, 0, SEEK_SET);
    truncate($fd, 0);
    
    print($fd $stripped);

    close($fd);
}
