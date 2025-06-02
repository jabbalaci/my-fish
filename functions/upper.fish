false && begin  # example
    % echo "hEllO" | upper
    HELLO

    % echo "hEllO" | upper | lower
    hello
end


function upper -d "Convert to uppercase (filter)"
    if test -n "$argv"
        string upper -- $argv
    else
        cat | string upper
    end
end

# python3 -S -c "
# import sys
#
# for line in sys.stdin:
    # print(line.upper(), end='')
# "
