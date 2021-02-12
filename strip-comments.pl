#/usr/bin/env perl

use strict;
use warnings;

use Fcntl qw(SEEK_SET);

my $isInsideMultilineComment = 0;

foreach my $file (@ARGV) {
    open(my $fd, "+<", $file) or die $!;

    my $stripped = "";

    foreach my $line (<$fd>) {
        next if $line =~ /\/\/[<>].*/;

        if ($line =~ /\/\*/) {
            $isInsideMultilineComment = 1;
        }

        if ($line =~ /\*\//) {
            $isInsideMultilineComment = 0;
            next;
        }

        next if $isInsideMultilineComment;

        $stripped .= $line;
    }

    seek($fd, 0, SEEK_SET);
    truncate($fd, 0);
    
    print($fd $stripped);

    close($fd);
}
