false && begin  # example
    % lscd_wrapper
    # Starts lscd. When you quit, you'll find yourself in the folder where you quit.
end

false && begin  # note
Starts lscd ( https://github.com/kernel1983/lscd ) and makes sure
to place you in the folder where you quit lscd.
end

function lscd_wrapper -d "Wrapper script for lscd"
    set -l output (command lscd $argv)
    if test $status -eq 0
        if test -d "$output"
            cd "$output"
        else if test -f "$output"
            switch (string split -r -m1 . -- "$output")[-1]
                case mkv avi mp4 m4a mp3
                    ffplay "$output" &>/dev/null &
                case '*'
                    vim "$output"
            end
        end
    end
    echo ""
end
