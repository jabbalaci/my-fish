false && begin  # example
    % machine_id
    i9-uni-office
end

false && begin  # note
I store a lot of things in Dropbox, thus I have the same environment on all my machines.
However, sometimes a program should behave differently on a specific machine.
I came up with the idea to create the file `~/MACHINE_ID`, which contains a unique
identifier string. This file is not synced among my computers. A program/script can
query the value of this file and set itself accordingly.
end


function machine_id -d "Print the machine ID"
    set -l text "unknown"
    if test -f $HOME/MACHINE_ID
        set text (command cat $HOME/MACHINE_ID | tr -d "\n")
    end
    echo $text
end
