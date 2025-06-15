# based on https://github.com/razzius/fish-functions/blob/main/functions/skip-lines.fish

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

    % seq 5 | skip last
    1
    2
    3
    4
end

false && begin  # note
Skips the first `n` lines of stdin.

If `last` is provided, then it skips the last line.
end


function skip --argument n -d "Skip the first `<n>` lines of stdin, or skip the last line if `last` is provided (filter)"
    if test "$n" = "last"
        head -n -1
        return
    end
    # else:
    tail +(math 1 + $n)
end
