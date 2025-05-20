false && begin  # example
    % echo 2025 | bin
    0b11111101001

    % echo 2025 | bin | unbin
    2025
end


function bin -d "Decimal number to binary (filter)"
    pypy3 -c "
import sys

try:
    s = int(sys.stdin.read())
    result = bin(s)
    print(result)
except:
    print('Error: provide a decimal number', file=sys.stderr)
    sys.exit(1)
"
end
