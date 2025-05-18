function rot13 -d "ROT13 cipher (filter)"
    python3 -c "
import codecs
import sys

try:
    text = sys.stdin.read().rstrip('\r\n')
    print(codecs.encode(text, 'rot_13'))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end
