false && begin  # example
    % unixtime
    1747902871

    % unixtime2date 1747902871
    2025-05-22 10:34:31
    2025. máj. 22., csütörtök, 10:34:31 CEST
end

false && begin  # note
Prints the Unix epoch time, i.e. the number of seconds
since January 1, 1970.

`unixtime2date` is the opposite.
end


function unixtime -d "Print the Unix epoch time"
    date +%s
end
