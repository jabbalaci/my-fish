false && begin  # example
    % upgrade_pipx_and_uv
    # updates packages that were installed with pipx and uv
    # it also updates uv \(which gets a new version almost every week\)
end

false && begin  # note
`pipx` and `uv` are two popular package managers for Python.
They have that nice feature that they can update all the packages
that were installed with them. This script triggers this update procedure.
end


function upgrade_pipx_and_uv -d "Upgrade packages installed with pipx and uv"
    pipx upgrade-all
    uv tool upgrade --all
end
