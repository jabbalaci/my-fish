false && begin  # example
    % repo
    # opens the GitHub URL of the current project
end

false && begin  # note
Under Manjaro, install this package:

```
yay -S github-cli
```

Under Manjaro, after an update, this command dropped some warnings.
The solution was to reinstall some packages:

```
sudo pacman -Syu mesa vulkan-intel ibus
```
end


function repo -d "Open the GitHub URL of the current project"
    set -l cmd "gh repo view --web"
    echo '#' $cmd
    fish -c $cmd
end
