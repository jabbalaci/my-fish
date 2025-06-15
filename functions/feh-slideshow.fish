false && begin  # example
    % feh-slideshow
    # start slideshow in the current directory
end

false && begin  # note
Meaning of the options:

* `-D 5`:          5 sec. delay
* `-F`:            fullscreen
* `-Z`:            auto-zoom images to fit screen
end


function feh-slideshow --argument sec -d "Start a slideshow with feh"
    if test -z "$sec"
        set sec 5
    end
	feh -D $sec -F -Z
end
