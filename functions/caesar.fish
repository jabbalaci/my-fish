function caesar -d "Caesar cipher with <rot> (filter)"
    set -l rot $argv[1]
    if test -z "$rot"
        echo "Usage: caesar <rot>" >&2
        return 1
    end

    python3 -c "
import sys

try:
    rot = int('$rot')
except:
    print('Error: rot must be an integer', file=sys.stderr)
    sys.exit(1)

def caesar_char(c, rot):
    if 'a' <= c <= 'z':
        return chr((ord(c) - ord('a') + rot) % 26 + ord('a'))
    elif 'A' <= c <= 'Z':
        return chr((ord(c) - ord('A') + rot) % 26 + ord('A'))
    else:
        return c

text = sys.stdin.read().rstrip('\r\n')
result = ''.join(caesar_char(c, rot) for c in text)
print(result)
"
end
