false && begin  # example
    % use_ic
    # create config.nims or print info about what to add to it
end

false && begin  # note
If we want to use incremental compilation in Nim, then the
simplest way is to create the file `config.nims` that contains
this setting. If the file doesn\'t exist, it\'ll be created.
If it exists, then an info line will be printed on the screen.
Incremental compilation is supported from Nim 2.4.0.
end

function use_ic -d "Create config.nims to use incremental compilation"
    set -l line 'switch("ic", "on")'

    if not test -e config.nims
        echo $line > config.nims
    else
        echo "# add this to your config.nims file:"
        echo "# $line"
    end
end
