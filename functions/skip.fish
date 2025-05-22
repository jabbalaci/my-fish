# https://github.com/razzius/fish-functions/blob/main/functions/skip-lines.fish

false && begin  # example
    % seq 5
    1
    2
    3
    4
    5

    % seq 5 | skip 2
    3
    4
    5
end

false && begin  # note
Skips the first `n` lines of stdin.
end


function skip --argument n -d "Skip the first `<n>` lines of stdin"
    tail +(math 1 + $n)
end
