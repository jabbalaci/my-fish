false && begin  # example
    % start_xmodmap
    # xmodmap is started
end

false && begin  # note
After a reboot, xmodmap doesn\'t always start automatically.
So with this script I can launch it manually.
end


function start_xmodmap -d "Start xmodmap (may be needed after a restart)"
    xmodmap ~/.Xmodmap
end

# skip
