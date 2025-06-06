false && begin  # example
    % echo 2025 | hex
    0x7e9

    % echo 2025 | hex | unhex
    2025
end


function hex -d "Decimal number to hex (filter)"
    python3 -S -c "
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

# echo 2025 | math --base 16
