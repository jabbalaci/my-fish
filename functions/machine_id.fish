function machine_id -d "Print the machine ID"
    set -l text "unknown"
    if test -f $HOME/MACHINE_ID
        set text (command cat $HOME/MACHINE_ID | tr -d "\n")
    end
    echo $text
end
