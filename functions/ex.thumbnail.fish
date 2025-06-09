false && begin  # example
    % echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg

    % echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail open
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg
    # and it also opens the thumbnail with the default image viewer
end

false && begin  # note
It extracts the URL of the thumbnail of a YouTube video.
end


function ex.thumbnail -d "Extract the URL of a YouTube video's thumbnail (filter)"
    set -l fname (mktemp)
    read -l url
    echo "# working..."
    yt-dlp -J $url >$fname 2>/dev/null
    set -l thumbnail_url (cat $fname | ex.urls | grep maxresdefault\.jpg | head -1)
	echo $thumbnail_url
	echo -n $thumbnail_url | xsel -b
	echo "# copied to the clipboard"
	if test "$argv[1]" = "open"
	    open $thumbnail_url 1>/dev/null 2>&1
	end

	command rm $fname
end
