false && begin  # example
    % bing
    https://www.bing.com/th?id=OHR.HoneyBeeLavender_ROW6706348405_tmb.jpg

    % bing open
    https://www.bing.com/th?id=OHR.HoneyBeeLavender_ROW6706348405_tmb.jpg
    # and it also opens the image with the default image viewer
end

false && begin  # note
It extracts the URL of the wallpaper photo on bing.com .
Sometimes it doesn\'t produce any output. Then try again :\)
end


function bing -d "Extract the URL of the wallpaper image on bing.com"
	set -l url (curl -s https://www.bing.com/ | ex.urls | grep jpg | head -1 | string split "&" | head -1)
	echo $url
	if test "$argv[1]" = "open"
	    open $url 1>/dev/null 2>&1
	end
end
