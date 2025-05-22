false && begin  # example
    % pwd
    /home/jabba

    % s

    % pwd
    /tmp/send
end

false && begin  # note
I like to store short-living temporary files in the `/tmp/send` folder.
It\'s in `/tmp`, but still in a separate subfolder. For instance, I need to send
3 files to a friend that are located in different folders. I copy them to
`/tmp/send`, send them via email \(since they are collected in the same folder,
it\'s easy to attach them\), then delete them from `/tmp/send`.

This script called `s` allows me to enter this folder with the speed of light.
end


function s -d "CD into /tmp/send"
    mkdir -p /tmp/send
    cd /tmp/send
end
