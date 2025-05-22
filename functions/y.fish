# from: https://yazi-rs.github.io/docs/quick-start#shell-wrapper

false && begin  # example
    % y
    # starts the yazi file manager
end

false && begin  # note
Use this function to start yazi. This way, when you
navigate somewhere in yazi and quit, you\'ll find yourself in the
directory where you quit.

Without this, you\'d get back to the folder where you launched yazi.
end


function y -d "Start yazi (and stay in the folder where you quit)"
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
