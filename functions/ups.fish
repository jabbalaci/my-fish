function ups --argument choice -d "Updates / upgrades"
    if test -z $choice
	    echo -n "\
ups 0           -> good_shape_manjaro (find fastest mirror servers)
---
ups 1           -> yay
ups 2           -> yay -Scc
ups 3           -> upgrade_pipx_and_uv
ups 4           -> flatpak update
ups 5           -> choosenim update stable
"
        return 0
    end

    switch $choice
        case '0'
            echo "# good_shape_manjaro"
            good_shape_manjaro
        case '1'
            echo "# yay"
            yay
        case '2'
            echo "# yay -Scc"
            yay -Scc
        case '3'
            echo "# upgrade_pipx_and_uv"
            upgrade_pipx_and_uv
        case '4'
            echo "# flatpak update"
            flatpak update
        case '5'
            echo "# choosenim update stable"
            choosenim update stable
            echo "# version info:"
            nim -V
        case '*'
            echo "unknown choice"
            return 1
    end
end
