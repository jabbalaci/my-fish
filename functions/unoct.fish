function unoct -d "Octal number to decimal (filter)"
    python3 -c "
import sys

try:
    s = sys.stdin.read()
    result = int(s, 8)
    print(result)
except:
    print('Error: provide an octal number', file=sys.stderr)
    sys.exit(1)
"
end
