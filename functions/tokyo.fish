false && begin  # example
    % tokyo
    🇭🇺 Debrecen Time: 2025-05-31 21:29:59 (CEST)
    🇯🇵 Tokyo Time:    2025-06-01 04:29:59 (JST)
end

false && begin  # note
Check the local time in Tokyo, Japan.
end


function tokyo -d "Check the local time in Tokyo, Japan"
    # my time
    set -l budapest_time (TZ="Europe/Budapest" date '+%Y-%m-%d %H:%M:%S (%Z)')
    echo "🇭🇺 Debrecen Time: $budapest_time"

    # Tokyo time
    set -l tokyo_time (TZ="Asia/Tokyo" date '+%Y-%m-%d %H:%M:%S (%Z)')
    echo "🇯🇵 Tokyo Time:    $tokyo_time"
end
