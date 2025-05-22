false && begin  # example
    % ren main.c
    New name: main.c
    # you can edit the file\'s name \(move the cursor, delete a char, etc.\)
end

false && begin  # note
It allows you to rename a file interactively.

Location of the script: https://github.com/jabbalaci/Bash-Utils/blob/master/ren.py
end


function ren -d "Rename a file interactively"
    $DROPBOX/python/Bash-Utils/ren.py $argv
end
