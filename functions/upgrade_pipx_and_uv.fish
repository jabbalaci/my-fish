function upgrade_pipx_and_uv -d "Upgrade packages installed with pipx and uv"
    pipx upgrade-all
    uv tool upgrade --all
end
