false && begin  # example
    % mc
    fish: Unknown command: mc
    extra/mc
end

false && begin  # note
Provides an Ubuntu-like suggestion when a command is not found.
end


function fish_command_not_found -d "Ubuntu-like suggestion when a command is not found"
    printf (_ "fish: Unknown command: %s\n") (string escape -- $argv[1]) >&2
    pkgfile $argv[1]
end
