function hex -d "Decimal number to hex (filter)"
    python3 -c "
import sys

try:
    s = int(sys.stdin.read())
    result = hex(s)
    print(result)
except:
    print('Error: provide a decimal number', file=sys.stderr)
    sys.exit(1)
"
end
