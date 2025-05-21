# https://github.com/razzius/fish-functions/blob/main/functions/coln.fish

false && begin  # example
    % echo 1 2 | getcol 2
    2
end

false && begin  # note
**get** the given **col**umn
end


function getcol -d "Split the input on whitespace and print the column indicated (filter)"
    awk '{print $'$argv[1]'}'
end
