function fish_greeting -d "Default greeting message"
    if test (machine_id) = "asus-vivobook-s15"  # used for teaching
        #wezterm imgcat $DROPBOX/document/en/laszlo.jpg
        return
    end

    # else

    set -l choice (random 1 3)
    switch $choice
        case 1
            random-functions
        case 2
            echo "Jabuci" | figlet -f rectangles | nonempty
        case 3
            echo "Manjaro Linux" | figlet -f rectangles | nonempty
        case 4
            dos-greeting
            dos-prompt
    end
end
