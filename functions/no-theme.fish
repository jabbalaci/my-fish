false && begin  # example
    % no-theme
    # no colors as you type
end

false && begin  # note
As you type, everything has the same color.

By default, fish adds colors to syntactic elements.
With `no-theme` you can disable it.
end


function no-theme -d "Select the None theme (no colors)"
    fish_config theme choose None
end
