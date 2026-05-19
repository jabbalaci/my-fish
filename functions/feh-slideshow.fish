false && begin  # example
    % feh-slideshow
    # start slideshow in the current directory
end

false && begin  # note
Meaning of the options:

* `-D 4`:          4 sec. delay
* `-F`:            fullscreen
* `-Z`:            auto-zoom images to fit screen
* `-z`:            randomize the file list
end


function feh-slideshow --argument sec -d "Start a slideshow with feh"
    if test -z "$sec"
        set sec 4
    end
	feh -D $sec -F -Z -z
end
