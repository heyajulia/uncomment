my Regex constant $section-directive = /^("//<" | "//>")/;
my Regex constant $multiline-comment-open = /"/*"/;
my Regex constant $multiline-comment-close = /"*/"/;

for @*ARGS -> $file {
    note "Uncommenting $file";

    my Str $uncommented = "";

    my Bool $inside-multiline-comment = False;

    for $file.IO.lines(:!chomp) -> $line {
        next if $line ~~ $section-directive;

        if $line ~~ $multiline-comment-open {
            $inside-multiline-comment = True;
        } elsif $line ~~ $multiline-comment-close {
            $inside-multiline-comment = False;
            next;
        }

        next if $inside-multiline-comment;

        $uncommented ~= $line;
    }

    spurt $file, $uncommented;
}
