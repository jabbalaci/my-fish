false && begin  # example
    % echo "ʃʃǝɥs ɥsᴉℲ" | unflip
    Fish shell

    % echo "ʃʃǝɥs ɥsᴉℲ" | unflip | flip
    ʃʃǝɥs ɥsᴉℲ
end


function unflip -d "Revert upside-down Unicode text back to normal (filter)"
    python3 -S -c "
import sys

# Inverse mapping of flipped characters
flip_map = {
    'ɐ': 'a', 'q': 'b', 'ɔ': 'c', 'p': 'd', 'ǝ': 'e',
    'ɟ': 'f', 'ƃ': 'g', 'ɥ': 'h', 'ᴉ': 'i', 'ɾ': 'j',
    'ʞ': 'k', 'ʃ': 'l', 'ɯ': 'm', 'u': 'n', 'o': 'o',
    'd': 'p', 'b': 'q', 'ɹ': 'r', 's': 's', 'ʇ': 't',
    'n': 'u', 'ʌ': 'v', 'ʍ': 'w', 'x': 'x', 'ʎ': 'y',
    'z': 'z',
    '∀': 'A', '𐐒': 'B', 'Ɔ': 'C', '◖': 'D', 'Ǝ': 'E',
    'Ⅎ': 'F', 'פ': 'G', 'H': 'H', 'I': 'I', 'ſ': 'J',
    'ʞ': 'K', '˥': 'L', 'W': 'M', 'N': 'N', 'O': 'O',
    'Ԁ': 'P', 'Ό': 'Q', 'ᴚ': 'R', 'S': 'S', '┴': 'T',
    '∩': 'U', 'Λ': 'V', 'M': 'W', 'X': 'X', '⅄': 'Y',
    'Z': 'Z',
    '0': '0', 'Ɩ': '1', 'ᄅ': '2', 'Ɛ': '3', 'ㄣ': '4',
    'ϛ': '5', '9': '6', 'ㄥ': '7', '8': '8', '6': '9',
    '˙': '.', '\'': ',', ',': '\'', ',,': '\"', '¡': '!',
    '¿': '?', ')': '(', '(': ')', ']': '[', '[': ']',
    '}': '{', '{': '}', '>': '<', '<': '>', '⅋': '&',
    '‾': '_', 'v': '^', '\n': '\n'
}

def unflip_line(line):
    return ''.join(flip_map.get(c, c) for c in reversed(line))

for line in sys.stdin:
    print(unflip_line(line.rstrip()))
"
end
