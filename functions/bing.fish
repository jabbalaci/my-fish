# $ bing
# $ bing open

function bing -d "Extract the URL of the wallpaper image on bing.com"
	set -l url (curl -s https://www.bing.com/ | ex.urls | grep jpg | head -1 | string split "&" | head -1)
	echo $url
	if test "$argv[1]" = "open"
	    open $url 1>/dev/null 2>&1
	end
end
