false && begin  # example
    % echo "hEllO" | capitalize
    Hello
end


function capitalize -d "Convert to capitalized text (filter)"
    python3 -S -c "
import sys

s = sys.stdin.read()
print(s.capitalize(), end='')
"
end
