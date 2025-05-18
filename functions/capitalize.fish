function capitalize -d "Convert to capitalized text (filter)"
    python3 -c "
import sys

s = sys.stdin.read()
print(s.capitalize(), end='')
"
end
