false && begin  # example
    % echo 1110 | unbin
    14

    % echo 1110 | unbin | bin
    0b1110
end


function unbin -d "Binary number to decimal (filter)"
    python3 -S -c "
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

# echo "ibase=2; 101010" | bc
