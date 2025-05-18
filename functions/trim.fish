function trim -d "Trim leading/trailing whitespace (filter)"
    python3 -c "
import sys

s = sys.stdin.read().strip()
print(s)
"
end
