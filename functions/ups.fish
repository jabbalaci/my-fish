false && begin  # example
    % ups
    # brings up a "menu" with all the update/upgrade possibilities
end

false && begin  # note
This script brings up a "menu" from which I can select the update/upgrade option.
I regularly need to update the mirror list, upgrade the packages,
upgrade softwares installed with pipx and uv, etc. I cannot keep
all the update commands in my head. This script helps me keep
my system up-to-date without causing any mental overhead.
end


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
