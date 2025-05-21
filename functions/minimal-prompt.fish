false && begin  # example
    % minimal-prompt
    # you get a simple \$ sign for your prompt
end

false && begin  # note
Might be useful if you want to do a demo and you want to hide your fancy prompt
to avoid distraction.
end


function minimal-prompt -d "A minimal prompt"
    function fish_prompt
        set last_status $status
        printf '$ '
    end
end
