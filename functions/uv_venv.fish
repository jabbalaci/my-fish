false && begin  # example
    % uv init

    % uv_venv
end

false && begin  # note
See https://github.com/jabbalaci/uv_venv for a detailed description.

In short:

The command uv venv creates `.venv/` in the project folder.

This script creates the virt. env. in a separate folder \(`~/.virtualenvs`\), and in the project folder
it creates a symbolic link called `.venv` that points on the virt. env. located in `~/.virtualenvs`.
end


function uv_venv -d "Call the `uv_venv` script"
    $DROPBOX/python/uv_venv/uv_venv.py
end
