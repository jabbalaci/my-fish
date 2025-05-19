false && begin  # example
    % echo "hEllO" | upper
    HELLO
end


function upper -d "Convert to uppercase (filter)"
    python3 -c "
import sys

for line in sys.stdin:
    print(line.upper(), end='')
"
end
