false && begin  # example
    % echo 2025 | oct
    0o3751

    % echo 2025 | oct | unoct
    2025
end


function oct -d "Decimal number to octal (filter)"
    python3 -S -c "
import sys

try:
    s = int(sys.stdin.read())
    result = oct(s)
    print(result)
except:
    print('Error: provide a decimal number', file=sys.stderr)
    sys.exit(1)
"
end

# echo 2025 | math --base 8
