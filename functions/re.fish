false && begin  # example
    % re
    # the Dropbox client starts synchronizing
end

false && begin  # note
When I wake up a computer from suspend mode, sometimes the Dropbox client
doesn\'t recognize that it should start synchronizing. With this script
I can force it to start working.
end


function re -d "Wake up the Dropbox client"
    echo "# waking up the Dropbox client"
    set -l FILE ~/Dropbox/tmp774545.txt
    touch "$FILE"
    sleep 10
    rm -f "$FILE"
end
