# based on https://forum.nim-lang.org/t/13921

false && begin  # note
It prints the list of recently visited directories.
You can select interactively the dir where you want to jump to.
The visited dirs are logged in a file. See `04-log_dirs.fish` .
end

function jl -d "*j*ump to a previously (*l*ast) visited dir."
    echo "# jump to a previously visited dir:"
    # Run the selection logic
    set -l selection (tail -n20 $PWD_LOG_FILE | tac | uniq_keep_order | vip -ri)
    # If a selection was made...
    if test -n "$selection"
        cd "$selection"
    end
    # Force a repaint to ensure the UI updates immediately
    commandline -f repaint
end
