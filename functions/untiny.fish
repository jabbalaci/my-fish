false && begin  # example
    % echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny
    FiSh Shell

    % echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ
end

false && begin  # note
Conversion from tiny to normal is not perfect due to some Unicode limitations.
end


function untiny -d "Convert tiny superscript letters back to normal text [not perfect] (filter)"
    python3 -c "
import sys

d = {
    'a': 'ᵃ', 'b': 'ᵇ', 'c': 'ᶜ', 'd': 'ᵈ', 'e': 'ᵉ', 'f': 'ᶠ',
    'g': 'ᵍ', 'h': 'ʰ', 'i': 'ⁱ', 'j': 'ʲ', 'k': 'ᵏ', 'l': 'ˡ',
    'm': 'ᵐ', 'n': 'ⁿ', 'o': 'ᵒ', 'p': 'ᵖ', 'q': 'ᑫ', 'r': 'ʳ',
    's': 'ˢ', 't': 'ᵗ', 'u': 'ᵘ', 'v': 'ᵛ', 'w': 'ʷ', 'x': 'ˣ',
    'y': 'ʸ', 'z': 'ᶻ',
    'A': 'ᴬ', 'B': 'ᴮ', 'C': 'ᶜ', 'D': 'ᴰ', 'E': 'ᴱ', 'F': 'ᶠ',
    'G': 'ᴳ', 'H': 'ᴴ', 'I': 'ᴵ', 'J': 'ᴶ', 'K': 'ᴷ', 'L': 'ᴸ',
    'M': 'ᴹ', 'N': 'ᴺ', 'O': 'ᴼ', 'P': 'ᴾ', 'Q': 'ᑫ', 'R': 'ᴿ',
    'S': 'ˢ', 'T': 'ᵀ', 'U': 'ᵁ', 'V': 'ⱽ', 'W': 'ᵂ', 'X': 'ˣ',
    'Y': 'ʸ', 'Z': 'ᶻ',
    '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴', '5': '⁵',
    '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹', '+': '⁺', '-': '⁻',
    '=': '⁼', '(': '⁽', ')': '⁾'
}

SUPERSCRIPT_MAP = {v: k for k, v in d.items()}

def to_tiny(text):
    return ''.join(SUPERSCRIPT_MAP.get(c, c) for c in text)

# line has '\n' at the end:
for line in sys.stdin:
    print(to_tiny(line), end='')
"
end
