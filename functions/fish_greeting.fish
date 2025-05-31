false && begin  # note
When you open a new terminal / tab, this function is called automatically.
With this you can print some greeting message before the first prompt.

If this function doesn\'t print anything on the screen, then there\'s no
greeting message. If you want to disable messages, just leave its body empty.
end


function fish_greeting -d "Default greeting message"
    if test (machine_id) = "asus-vivobook-s15"  # used for teaching
        #wezterm imgcat $DROPBOX/document/en/laszlo.jpg
        echo "Jabba Laci" | figlet -f rectangles | nonempty
        return
    end

    # else

    set -l choice (random 1 2)
    switch $choice
        case 1
            random-functions
        case 2
            set -l options "Jabba Laci" "Jabuci" "Manjaro Linux"
            set -l text $options[(random 1 2)]
            echo $text | figlet -f rectangles | nonempty
        case 3
            dos-greeting
            dos-prompt
    end
end
