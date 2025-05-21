false && begin  # example
    % epair bin
    # opens bin.fish and unbin.fish in your text editor

    % epair unbin
    # opens unbin.fish and bin.fish in your text editor
end

false && begin  # note
**e**dit a **pair** of functions from anywhere

If a function has an un*.fish pair, then you can edit both of them
in your text editor side by side. The `micro` text editor is used by default.
end


function epair --argument name -d "Edit the given function and its pair (ex.: hex and unhex)"
    if test -z "$name"
        echo "Error: name argument (without .fish) is required" >&2
        return 1
    end

    set -l func_dir ~/.config/fish/functions
    set -l file_a
    set -l file_b

    set file_a (string replace -r '.fish$' '' $name).fish
    set file_a (string replace -r '^un' '' $file_a)
    set file_b 'un'$file_a
    #
    set file_a $func_dir/$file_a
    set file_b $func_dir/$file_b

    set -l error false
    if not test -f "$file_a"
        echo "Not found: $file_a" >&2
        set error true
    end
    if not test -f "$file_b"
        echo "Not found: $file_b" >&2
        set error true
    end
    if $error
        return 1
    end

    micro -multiopen vsplit "$file_a" "$file_b"
end
