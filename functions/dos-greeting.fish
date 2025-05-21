false && begin  # example
    % dos-greeting
    Starting MS-DOS...

    HIMEM is testing extended memory...done.
end

false && begin  # note
For fun. Tip: combine it with `dos-prompt`.
end


function dos-greeting -d "Classical DOS starting screen"
    echo Starting MS-DOS...
    echo
    echo HIMEM is testing extended memory...done.
    echo
end
