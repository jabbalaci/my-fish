false && begin  # example
    % echo "hEllO" | capitalize
    Hello
end


function capitalize -d "Convert to capitalized text (filter)"
    pypy3 -c "
import sys

s = sys.stdin.read()
print(s.capitalize(), end='')
"
end
