# https://github.com/razzius/fish-functions/blob/main/functions/isodatetime.fish

false && begin  # example
    % isodatetime
    2025-05-21T13:57:28
end

false && begin  # note
Can be used as a timestamp.
end


function isodatetime -d "Print timestamp in YYYY-MM-DDTHH:MM:SS format"
    date +"%Y-%m-%dT%H:%M:%S"
end
