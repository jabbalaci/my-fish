false && begin  # example
    % echo "SOS Titanic" | morse
    ... --- ... / - .. - .- -. .. -.-.

    % echo "SOS Titanic" | morse | unmorse
    SOS TITANIC
end

false && begin  # note
* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code
end


function morse -d "Convert text to Morse code [e.g., 'SOS' -> '... --- ...'] (filter)"
    python3 -c "
import sys

MORSE_CODE = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..',
    '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-',
    '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
    '.': '.-.-.-', ',': '--..--', '?': '..--..', '\'': '.----.', '!': '-.-.--',
    '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...', ':': '---...',
    ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-',
    '\"': '.-..-.', '\$': '...-..-', '@': '.--.-.', ' ': '/'
}

for line in sys.stdin:
    # Convert each character to Morse, skip unsupported chars
    morse_text = ' '.join(
        MORSE_CODE.get(char.upper(), '')
        for char in line.strip()
    )
    print(morse_text)
"
end
