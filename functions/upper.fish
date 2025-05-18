function upper -d "Convert to uppercase (filter)"
    python3 -c "
import sys

s = sys.stdin.read()
print(s.upper(), end='')
"
end
