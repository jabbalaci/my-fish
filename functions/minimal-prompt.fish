function minimal-prompt -d "A minimal prompt"
    function fish_prompt
        set last_status $status
        printf '$ '
    end
end
