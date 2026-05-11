false && begin  # example
    % c main.c
    # compiled to a.out

    % ./a.out
    hello world
end

false && begin  # note
Takes a source code and compiles it. It can be extended to support various languages.
end


function c --argument fname -d "Compile a source code"
    if test -z "$fname"
        echo "Compile what?" >&2
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
            set -l cmd (echo "gcc $rest $fname" | replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*.f90'
            set -l cmd (echo "gfortran $rest $fname"| replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*.d'
            set -l cmd (echo "dmd $rest $fname -of=a.out"| replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*.nim'
            set -l cmd (echo "nim c $rest $fname"| replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*.java'
            set -l cmd (echo "javac $rest $fname"| replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*.bas'
            set -l cmd (echo "xcbasic3 $rest $fname"| replace "  " " ")
            echo '#' $cmd
            fish -c $cmd
        case '*'
            echo "Warning: unknown file type" >&2
            return 1
    end
end
