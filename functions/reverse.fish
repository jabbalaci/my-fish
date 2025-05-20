false && begin  # example
    % echo "hello" | reverse
    olleh

    % echo "hello" | reverse | reverse
    hello
end


function reverse -d "Reverse a string (filter)"
    python3 -S -c "
import sys

s = sys.stdin.read().rstrip('\r\n')
print(s[::-1])
"
end
