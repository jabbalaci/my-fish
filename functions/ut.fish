false && begin  # example
    % ut file.d
    # run unittests of `file.d` using rdmd
    % ut file.d -main
    # if `file.d` is a library, then an empty main() function is added
end

false && begin  # note
Run unittests on the given D source code using `rdmd`.
end

function ut -d "Run unittests on a D source file"
    if test (count $argv) -lt 1
        echo "Usage: ut <source.d> [-main]" >&2
        return 1
    end

    set -l add_main ""
    set -l filtered_args
    # Check for -main flag and filter arguments
    for arg in $argv
        if test "$arg" = "-main"
            set add_main "-main"
        else
            set filtered_args $filtered_args $arg
        end
    end
    set argv $filtered_args

    set -l cmd "rdmd -unittest $add_main $argv"
    echo '#' $cmd
    fish -c $cmd
end
