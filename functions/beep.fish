false && begin  # example
    % slow_command; beep
    # plays a beep sound
end

false && begin  # note
Plays a beep sound. Useful to notify you when a slow program finishes.
end


function beep -d "Play a beep sound"
    set -l sound $ASSETS/done.mp3
    mplayer $sound &>/dev/null
end
