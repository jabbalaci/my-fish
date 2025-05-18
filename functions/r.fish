function r --argument fname -d "Run a source code (compile and run)"
    if test -z "$fname"
        echo "Run what?" >&2
        return 1
    end

    if not test -f $fname
        echo "Error: $fname doesn't exist" >&2
        return 1
    end

    # remove the 1st element
    set -l rest $argv[2..-1]

    switch $fname
        case '*.c'
            gcc $fname
            ./a.out $rest
        case '*.py'
            chmod u+x $fname
            ./$fname $rest
        case '*.sh' '*.fish'
            chmod u+x $fname
            ./$fname $rest
        case '*'
            echo "Warning: unknown file type" >&2
            return 1
    end
end
