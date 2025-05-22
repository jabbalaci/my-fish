false && begin  # example
    % xfce-info
    # starts a GUI app.
end

false && begin  # note
Starts a GUI application where you can check the version of your XFCE.

Tip: the `fastfetch` command can also tell you this information in the command line.
end


function xfce-info -d "Current XFCE version"
    xfce4-about 2>/dev/null &
end
