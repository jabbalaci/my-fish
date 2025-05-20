false && begin  # example
    % echo "hello" | hexview
    68 65 6C 6C 6F 0A

    % echo -n "hello" | hexview
    68 65 6C 6C 6F
    # echo -n: no newline character
end


function hexview -d "Show hex values of the input (filter)"
    python3 -S -c "
import sys

for line in sys.stdin:
    print(' '.join(f'{ord(c):02X}' for c in line), end='')
    print()
"
end
