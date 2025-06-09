false && begin  # example
    % dos-greeting
    Starting MS-DOS...

    HIMEM is testing extended memory...done.
end

false && begin  # note
For fun. Tip: combine it with `dos-prompt`.
end


function dos-greeting -d "Classical DOS starting screen"
    function fish_greeting  # disable other greeting message
    end

    echo Starting MS-DOS...
    echo
    # echo HIMEM is testing extended memory...done.
    echo -n HIMEM is testing extended memory
    python -S -c "
from time import sleep
for _ in range(3):
    print('.', end='', flush=True)
    sleep(0.5)
"
    echo done.
    echo
end
