false && begin  # example
    % echo "hello" | len
    5
end


function len -d "Length of a string (filter)"
    python3 -S -c "
import sys

s = sys.stdin.read().rstrip('\r\n')
print(len(s))
"
end
