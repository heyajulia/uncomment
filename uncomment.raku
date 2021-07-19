for @*ARGS -> $file {
    note "Uncommenting $file";

    my Regex $section-directive = /^("//<" | "//>")/;
    my Regex $multiline-comment-open = /"/*"/;
    my Regex $multiline-comment-close = /"*/"/;

    my Str $text = slurp $file;
    my Str $uncommented = "";

    my Bool $inside-multiline-comment = False;

    for $text.lines -> $line {
        next if $line ~~ $section-directive;

        if $line ~~ $multiline-comment-open {
            $inside-multiline-comment = True;
        }

        if $line ~~ $multiline-comment-close {
            $inside-multiline-comment = False;
            next;
        }

        next if $inside-multiline-comment;

        $uncommented ~= "$line\n";
    }

    spurt $file, $uncommented;
}