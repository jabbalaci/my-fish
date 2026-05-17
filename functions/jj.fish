# based on https://forum.nim-lang.org/t/13921

false && begin  # note
It prints the list of most frequently visited directories.
You can select interactively the dir where you want to jump to.
The visited dirs are logged in a file. See `04-log_dirs.fish` .
end

function jj -d "*j*ump to a frequently visited dir."
    echo "# jump to a frequently visited dir:"
    # Run the selection logic
    set -l selection (lfreq -o.975 -f@k -n-99999 < $PWD_LOG_FILE | vip -ri)
    # If a selection was made...
    if test -n "$selection"
        cd "$selection"
    end
    # Force a repaint to ensure the UI updates immediately
    commandline -f repaint
end
