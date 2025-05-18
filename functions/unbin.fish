function unbin -d "Binary number to decimal (filter)"
    python3 -c "
import sys

try:
    s = sys.stdin.read()
    result = int(s, 2)
    print(result)
except:
    print('Error: provide a binary number', file=sys.stderr)
    sys.exit(1)
"
end
