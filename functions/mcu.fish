false && begin  # example
    % mcu
    # starts Midnight Commander without a subshell (Ctrl+o doesn't work)
    # MC works faster this way
end

false && begin  # note
Use this function to start Midnight Commander without a subshell.
This way, MC works faster. When you navigate somewhere in MC and quit,
you\'ll find yourself in the directory where you quit.
end


function mcu -d "Launch Midnight Commander without a subshell and stay in the folder where you quit"
    set -l MC_USER (whoami)
    set -l MC_PWD_DIR "/tmp/mc-$MC_USER"
    mkdir -p $MC_PWD_DIR 2>/dev/null
    set -l MC_PWD_FILE "$MC_PWD_DIR/mc.pwd.$fish_pid"

    /usr/bin/mc -u -P "$MC_PWD_FILE" $argv

    if test -r "$MC_PWD_FILE"
        set -l MC_PWD (cat "$MC_PWD_FILE")
        if test -n "$MC_PWD" && test "$MC_PWD" != "$PWD" && test -d "$MC_PWD"
            cd "$MC_PWD"
        end
    end

    rm -f "$MC_PWD_FILE"
end
