false && begin  # example
    % cd /

    % pwd
    /

    % qj db

    % pwd
    /home/jabba/Dropbox
end

false && begin  # note
This is a launcher for my QJump project.
Available here: https://github.com/jabbalaci/qjump
end

function qj -d "QuickJump script"
    set -l QJ "$DROPBOX/nim/_projects/qjump/qjump.nim"
    if test -z $argv[1]
        $QJ
    else
        cd ($QJ $argv[1])
    end
end
