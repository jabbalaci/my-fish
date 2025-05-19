false && begin  # example
    % echo "hEllO" | lower
    hello
    % echo "hEllO" | lower | upper
    HELLO
end


function lower -d "Convert to lowercase (filter)"
    python3 -c "
import sys

for line in sys.stdin:
    print(line.lower(), end='')
"
end
