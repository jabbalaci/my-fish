function resolution -d "Current resolution"
    xrandr | grep \* | coln 1
end
