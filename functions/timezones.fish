false && begin  # example
    % timezones
    Africa/Abidjan
    Africa/Accra
    ...
end

false && begin  # note
See also https://worldtimeapi.org/pages/examples .
end


function timezones -d "List of valid timezones"
    python3 -S -c "
from zoneinfo import available_timezones

for timezone in sorted(available_timezones()):
    print(timezone)
"
end
