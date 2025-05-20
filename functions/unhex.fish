false && begin  # example
    % echo ff | unhex
    255

    % echo ff | unhex | hex
    0xff
end


function unhex -d "Hex number to decimal (filter)"
    pypy3 -c "
import sys

try:
    s = sys.stdin.read()
    result = int(s, 16)
    print(result)
except:
    print('Error: provide a hex number', file=sys.stderr)
    sys.exit(1)
"
end
