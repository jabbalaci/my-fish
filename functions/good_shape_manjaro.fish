false && begin  # example
    % good_shape_manjaro
    # updates mirror servers
end

false && begin  # note
On Manjaro Linux, it updates the list of mirror servers and sorts them by response time.

It only checks mirror servers on your continent.
end


function good_shape_manjaro -d "Update the list of mirror servers, find the fastest ones"
    sudo pacman-mirrors --continent && sudo pacman -Syyu
end
