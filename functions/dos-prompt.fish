false && begin  # example
    % pwd
    /home/jabba

    % dos-prompt
    C:\\Users\\jabba\>
end

false && begin  # note
It changes the prompt to a DOS-style prompt. Tip: combine it with `dos-greeting`.
end


function dos-prompt -d "Activate the DOS prompt"
    function fish_prompt
        set -l dir (pwd)
        set -l bold (set_color -o black)

        # -r: regex
        set dir (string replace -r '^/home/' '/Users/' "$dir")
        if test "$dir" = "/home"
            set dir '/Users'
        end
        # -a: all
        set dir (string replace -a '/' '\\' "$dir")

        echo -n -s $bold 'C:' "$dir" "> " $normal
    end
end
