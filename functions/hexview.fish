function hexview -d "Show hex values of the input (filter)"
    python3 -c "
import sys

for line in sys.stdin:
    print(' '.join(f'{ord(c):02X}' for c in line), end='')
    print()
"
end
