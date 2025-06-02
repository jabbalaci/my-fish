false && begin  # example
    % echo "hEllO" | lower
    hello

    % echo "hEllO" | lower | upper
    HELLO
end


function lower -d "Convert to lowercase (filter)"
    python3 -S -c "
import sys

for line in sys.stdin:
    print(line.lower(), end='')
"
end

# printf "%s\n" foo BAR Baz | string lower
