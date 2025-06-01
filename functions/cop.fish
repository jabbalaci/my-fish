false && begin  # example
    % cop main.c
    Copy\'s name: main.c
    # you can edit the file\'s name \(move the cursor, delete a char, etc.\)
end

false && begin  # note
It allows you to copy a file interactively.
end


function cop -d "Copy a file interactively"
    $HOME/.config/fish/myscripts/cop.py $argv
end
