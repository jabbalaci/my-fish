false && begin  # example
    % cd /
    % pwd
    /
    % qj db
    % pwd
    /home/jabba/Dropbox
end

false && begin  # note
This is a launcher for my QuickJump script.
Available here: https://github.com/jabbalaci/quickjump
end


function qj -d "QuickJump script"
    set -l QJ "$DROPBOX/python/quickjump/quickjump.py"
    if test -z $argv[1]
        $QJ
    else
        cd ($QJ $argv[1])
    end
end
