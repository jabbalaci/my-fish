false && begin  # example
    % no-autosuggestions
end

false && begin  # note
Disables autosuggestions. As you type, nothing will appear in gray after the cursor.

Might be useful when you do a demo and others can see your screen and
you don\'t want to reveal what files you downloaded last time with wget...
end


function no-autosuggestions -d "Disable autosuggestions"
    set -g fish_autosuggestion_enabled 0
end
