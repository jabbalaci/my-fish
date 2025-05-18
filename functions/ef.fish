function ef --argument name -d "Edit the given function"
    if test -z "$name"
        echo "Error: name argument (without .fish) is required" >&2
        return 1
    end

    switch $name
        case '*.fish'
            $EDITOR $FISH_FUNCTIONS_DIR/$name
        case '*'
            $EDITOR $FISH_FUNCTIONS_DIR/$name.fish
    end
end
