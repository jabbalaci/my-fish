false && begin  # example
    % get-function-description upper
    Convert to uppercase \(filter\)
end

false && begin  # note
Prints the description of the given function.
end


function get-function-description --argument name -d "Print the description of a function"
    if test -z "$name"
        echo "Error: name argument is required" >&2
        return 1
    end

    echo (functions -Dv $name)[-1]
end
