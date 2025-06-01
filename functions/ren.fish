false && begin  # example
    % ren main.c
    New name: main.c
    # you can edit the file\'s name \(move the cursor, delete a char, etc.\)
end

false && begin  # note
It allows you to rename a file interactively.
end


function ren -d "Rename a file interactively"
    $HOME/.config/fish/myscripts/ren.py $argv
end
