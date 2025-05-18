function unixtime2date --argument unixtime -d "Convert Unix epoch time to normal date"
    if test -z "$unixtime"
        echo "Error: unixtime argument is required" >&2
        return 1
    end

    date -d @$unixtime '+%Y-%m-%d %H:%M:%S'
    date -d @$unixtime
end
