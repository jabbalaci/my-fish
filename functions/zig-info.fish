false && begin  # example
    % zig-info
    # print some info about its basic usage
end


function zig-info -d "My abbreviations for zig"
    set -l fname "$FISH_DIR/02-aliases.fish"
    cat $fname | grep zig
end
