function good_shape_manjaro -d "Update the list of mirror servers, find the fastest ones"
    sudo pacman-mirrors --continent && sudo pacman -Syyu
end
