function obfuscate -d "Replace letters with similar-looking symbols [e -> 3, a -> @, etc.] (filter)"
    python3 -c "
import sys

OBFUSCATE_MAP = {
    'a': '@', 'A': '4',
    'b': '8', 'B': '8',
    'e': '3', 'E': '3',
    'g': '9', 'G': '6',
    'i': '1', 'I': '!',
    'l': '1', 'L': '|',
    'o': '0', 'O': '0',
    's': '\$', 'S': '5',
    't': '7', 'T': '7',
    'z': '2', 'Z': '2'
}

def obfuscate_text(text):
    return ''.join(OBFUSCATE_MAP.get(c, c) for c in text)

for line in sys.stdin:
    sys.stdout.write(obfuscate_text(line))  # Preserves original formatting
"
end
