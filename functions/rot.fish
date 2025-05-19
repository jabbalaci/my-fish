function rot --argument n -d "Rotate letters with with <n> positions (filter)"
    if test -z "$n"
        echo "Usage: rot <n>" >&2
        return 1
    end

    python3 -c "
import sys

try:
    rot = int('$n')
except:
    print('Error: n must be an integer', file=sys.stderr)
    sys.exit(1)

def caesar_char(c, rot):
    if 'a' <= c <= 'z':
        return chr((ord(c) - ord('a') + rot) % 26 + ord('a'))
    elif 'A' <= c <= 'Z':
        return chr((ord(c) - ord('A') + rot) % 26 + ord('A'))
    else:
        return c

for line in sys.stdin:
    result = ''.join(caesar_char(c, rot) for c in line)
    print(result, end='')
"
end
