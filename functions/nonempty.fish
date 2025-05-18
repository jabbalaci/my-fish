function nonempty -d "Remove empty lines (filter)"
    python3 -c "
import sys

lines = sys.stdin.read().splitlines()
for l in lines:
    if l.strip():
        print(l)
"
end
