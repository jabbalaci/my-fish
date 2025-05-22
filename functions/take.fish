# https://github.com/razzius/fish-functions/blob/main/functions/take.fish

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
end

false && begin  # note
Take the first `n` lines of standard input.
end


function take --argument number -d "Take the first `<n>` lines of stdin (filter)"
    head -$number
end
