false && begin  # example
    % cat main.c | hexview2
    # opens an editor in split mode
    # left side: content of the file
    # right side: hex values of the lines
end

false && begin  # note
You can see the input and the hex values side-by-side.
The hex values are generated with the `hexview` filter.
end


function hexview2 -d "Show the input and the hex values of the input side-by-side (filter)"
    set -l file1 (mktemp)
    set -l file2 (mktemp)

    while read -l line
        echo $line >>$file1
    end

    cat $file1 | hexview >$file2

    micro -multiopen vsplit $file1 $file2

    command rm $file1 $file2
end
