false && begin  # example
    % zoli
    🇭🇺 Debrecen Time:   2025-05-31 21:29:59 (CEST)
    🇺🇸 US Eastern Time: 2025-05-31 15:29:59 (EDT)
end

false && begin  # note
Check my friend\'s local time.
end


function zoli -d "Check my friend's local time"
    # my time
    set -l budapest_time (TZ="Europe/Budapest" date '+%Y-%m-%d %H:%M:%S (%Z)')
    echo "🇭🇺 Debrecen Time:   $budapest_time"

    # friend's time
    set -l eastern_time (TZ="America/New_York" date '+%Y-%m-%d %H:%M:%S (%Z)')
    echo "🇺🇸 US Eastern Time: $eastern_time"
end
