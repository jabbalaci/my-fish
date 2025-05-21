false && begin  # example
    % jive
    # starts my JiVE image viewer
end

false && begin  # note
JiVE is an image viewer with some built-in NSFW support...

The project can be found here: https://github.com/jabbalaci/JiVE-Image-Viewer
end


function jive -d "Start the JiVE image viewer"
    set -l bak (pwd)
    cd $DROPBOX/python/JiVE-Image-Viewer
    ./start.sh $argv &
    cd $bak
end
