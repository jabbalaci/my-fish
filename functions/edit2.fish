false && begin  # example
    % edit2 file1 file2
    # opens both files in a text editor side by side
end

false && begin  # note
It opens the two files with the [micro]\(https://micro-editor.github.io/\)
text editor \(my favourite\) side by side.

Same thing with vim: `vim -O file1 file2`
end

function edit2 -d "Edit two files side by side"
    if test (count $argv) -lt 2
        echo "Usage: edit2 <file1> <file2>" >&2
        return 1
    end

    set -l file_a $argv[1]
    set -l file_b $argv[2]

    micro -multiopen vsplit "$file_a" "$file_b"

    # same effect with vim:
    # vim -O file1 file2
end
