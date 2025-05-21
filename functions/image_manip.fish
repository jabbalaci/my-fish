false && begin  # example
    % image_manip
    Image Manipulator v0.1 by Jabba Laci \(jabba.laci@gmail.com\), 2021
    ...
end

false && begin  # note
It starts my simple image manipulator tool that allows me
to do some basic operations in batch mode: remove EXIF data,
rotate images by 90 degrees, etc.
end


function image_manip -d "Start the image manipulator tool"
    $DROPBOX/python/ImageManip/image_manip.py
end

# skip
