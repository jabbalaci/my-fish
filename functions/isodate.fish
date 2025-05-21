# https://github.com/razzius/fish-functions/blob/main/functions/isodate.fish

false && begin  # example
    % isodate
    2025-05-21
end

false && begin  # note
Prints date in YYYY-MM-DD format.

Fun fact: in Hungary we use this format.
We\'re going from the big picture towards the details, not vice versa.
end


function isodate -d "Print date in YYYY-MM-DD format"
    date +%Y-%m-%d
end
