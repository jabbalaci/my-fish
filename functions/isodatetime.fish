# https://github.com/razzius/fish-functions/blob/main/functions/isodatetime.fish

function isodatetime -d "Print timestamp in YYYY-MM-DDTHH:MM:SS format"
    date +"%Y-%m-%dT%H:%M:%S"
end
