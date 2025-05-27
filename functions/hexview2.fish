false && begin  # example
    % cat main.c | hexview2
    # opens an editor in split mode
    # left side: content of the file
    # right side: hex values of the lines

    % cat main.c | hexview2 bin
    # bin mode is also available for hexview2
end

false && begin  # note
This filter is **made for text input** that may contain non-ASCII characters.
For binary files, use a proper hex editor.

You can see the input and the hex values side-by-side.
The hex values are generated with the `hexview` filter.
end


function hexview2 -d "Show the input and the hex values of the input side-by-side (filter)"
    set -l file1 (mktemp)
    set -l file2 (mktemp)

    while read -l line
        echo $line >>$file1
    end

    cat $file1 | hexview $argv >$file2

    micro -multiopen vsplit $file1 $file2

    command rm $file1 $file2
end
