function title -d "Convert to title case (filter)"
    python3 -c "
import sys

s = sys.stdin.read()
print(s.title(), end='')
"
end
