function beep -d "Play a beep sound"
    set -l sound $ASSETS/done.mp3
    mplayer $sound &>/dev/null
end
