false && begin  # example
    % kpx
    # starts keepassxc
end

false && begin  # note
This is a launcher for keepassxc.

[KeePassXC]\(https://keepassxc.org/\) is an excellent, cross-platform password manager.
end


function kpx -d "Start keepassxc"
    keepassxc 2>/dev/null &
end
