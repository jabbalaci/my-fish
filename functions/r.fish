false && begin  # example
    % r main.c
    Hello World

    % r sum.c 2 3
    5
end

false && begin  # note
Takes a source code and runs it. It can be extended to support various languages.
end


function r --argument fname -d "Run a source code (compile and run)"
    if test -z "$fname"
        echo "Run what?" >&2
        return 1
    end

    if not test -f $fname
        echo "Error: $fname doesn't exist" >&2
        return 1
    end

    # remove the 1st element and keep the rest
    set -l rest $argv[2..-1]

    set -l fname_without_ext $(echo $fname | p.fname)

    switch $fname
        case '*.c'
            gcc $fname && ./a.out $rest
        case '*.f90'
            gfortran $fname && ./a.out $rest
        case '*.d'
            # dmd $fname -of=a.out
            # ./a.out $rest
            set -l tmpdir $HOME/.rdmd
            if not test -d $tmpdir
                mkdir $tmpdir
            end
            rdmd --tmpdir=$tmpdir $argv
        case '*.py'
            chmod u+x $fname
            ./$fname $rest
        case '*.java'
            javac $fname && java $fname_without_ext $rest
        case '*.class'
            java $fname_without_ext $rest
        case '*.sh' '*.fish'
            chmod u+x $fname
            ./$fname $rest
        case '*'
            echo "Warning: unknown file type" >&2
            return 1
    end
end
