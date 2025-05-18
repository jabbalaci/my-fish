# https://github.com/razzius/fish-functions/blob/main/functions/curdir.fish
# Just the current directory name, please.

function dname -d "Print just the current directory name"
    if test -n "$argv[1]"
        echo "Error: no argument is required" >&2
        return 1
    end

    basename $PWD
end
