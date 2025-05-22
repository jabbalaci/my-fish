false && begin  # example
    % unixtime
    1747902871

    % unixtime2date 1747902871
    2025-05-22 10:34:31
    2025. máj. 22., csütörtök, 10:34:31 CEST
end

false && begin  # note
Takes a Unix epoch time \(number\) and converts it
back to human-friendly date.
end


function unixtime2date --argument unixtime -d "Convert Unix epoch time to normal date"
    if test -z "$unixtime"
        echo "Error: unixtime argument is required" >&2
        return 1
    end

    date -d @$unixtime '+%Y-%m-%d %H:%M:%S'
    date -d @$unixtime
end
