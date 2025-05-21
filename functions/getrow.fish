# https://github.com/razzius/fish-functions/blob/main/functions/row.fish

false && begin  # example
    % seq 3
    1
    2
    3

    % seq 3 | getrow 2
    2
end

false && begin  # note
**get** the given **row**
end


function getrow --argument index -d "Print the row of the input indicated (filter)"
    sed -n "$index p"
end
