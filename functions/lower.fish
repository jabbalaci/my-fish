false && begin  # example
    % echo "hEllO" | lower
    hello

    % echo "hEllO" | lower | upper
    HELLO
end


function lower -d "Convert to lowercase (filter)"
    if test -n "$argv"
        string upper -- $argv
    else
        cat | string lower
    end
end

# python3 -S -c "
# import sys
#
# for line in sys.stdin:
    # print(line.lower(), end='')
# "
