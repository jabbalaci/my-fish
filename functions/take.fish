# based on https://github.com/razzius/fish-functions/blob/main/functions/take.fish

false && begin  # example
    % seq 5
    1
    2
    3
    4
    5

    % seq 5 | take 3
    1
    2
    3

    % seq 5 | take last
    5
end

false && begin  # note
Take the first `n` lines of the standard input.

If `last` is provided, then take the last line.
end


function take --argument n -d "Take the first `<n>` lines of stdin, or take the last line if `last` is provided (filter)"
    if test "$n" = "last"
        tail -1
        return
    end
    # else:
    head -$n
end
