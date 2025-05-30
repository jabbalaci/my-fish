false && begin  # example
    % efs char
    # opens ~/.config/fish/myscripts/char.py in a text editor
end

false && begin  # note
**e**dit **f**unction\'s **s**cript

Sometimes, a function is just a wrapper \(launcher\) for a script.
For instance, `~/.config/fish/functions/char.fish` calls `~/.config/fish/myscripts/char.py`.
With `efs char`, you can edit `char.py`.
end


function efs --argument name -d "Edit the given function's corresponding script"
    if test -z "$name"
        echo "Error: name argument (without extension) is required" >&2
        return 1
    end

    switch $name
        case '*.py'
            $EDITOR $FISH_MYSCRIPTS_DIR/$name
        case '*.fish'
            set -l new_name (echo -n $name | replace ".fish", ".py")
            $EDITOR $FISH_MYSCRIPTS_DIR/$new_name
        case '*'
            $EDITOR $FISH_MYSCRIPTS_DIR/$name.py
    end
end
