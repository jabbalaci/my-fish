false && begin  # example
    % resolution
    1920x1080
end

false && begin  # note
Shows your current resolution.
end


function resolution -d "Current resolution"
    xrandr | grep \* | getcol 1
end
