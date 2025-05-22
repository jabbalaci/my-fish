false && begin  # example
    % pwd
    /tmp/send

    % sp
    # copied to the clipboard
    /tmp/send

    % sp main.c
    # copied to the clipboard
    /tmp/send/main.c
end

false && begin  # note
`sp` stands for **s**how **p**ath.

`sp` alone shows the current directory and copies it to the clipboard.

`sp \<filename\>` shows the path of the given file and copies the file\'s
path to the clipboard.

`sp.py` can be found here: https://github.com/jabbalaci/Bash-Utils/blob/master/sp.py
end


function sp -d "Show the current path or show the path of a given file"
    $DROPBOX/python/Bash-Utils/sp.py $argv
end
