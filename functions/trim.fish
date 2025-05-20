false && begin  # example
    % echo "     aa bb    " | trim
    aa bb

    % echo "     aa bb    " | trim | len
    5
end


function trim -d "Trim leading/trailing whitespace (filter)"
    python3 -c "
import sys

s = sys.stdin.read().strip()
print(s)
"
end
