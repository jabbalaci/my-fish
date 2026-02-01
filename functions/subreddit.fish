false && begin  # example
    % subreddit https://old.reddit.com/r/d_language/
    subscribers: 5,210
end


function subreddit -d "Number of subscribers of a subreddit"
    if test -z "$argv[1]"
        echo "Error: Please provide the URL of a subreddit"
        return 1
    end

    set -l url "$argv[1].json"
    set -l temp_file /tmp/45trer75tzg.json
    wget $url -O $temp_file &>/dev/null
    echo -n "subscribers: "
    json $temp_file | grep "subreddit_subscribers" | head -1 | awk '{print $3}' | prettynum
end
