# based on https://forum.nim-lang.org/t/13921

function jf -d "*j*ump to a *f*requently visited dir."
    echo "# frequently visited dirs:"
    # Run the selection logic
    set -l selection (lfreq -o.975 -f@k -n-99999 < $PWD_LOG_FILE | vip -ri)
    # If a selection was made...
    if test -n "$selection"
        cd "$selection"
    end
    # Force a repaint to ensure the UI updates immediately
    commandline -f repaint
end
