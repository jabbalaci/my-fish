false && begin  # example
    % echo "- .. - .- -. .. -.-." | unmorse
    TITANIC

    % echo "- .. - .- -. .. -.-." | unmorse | morse
    - .. - .- -. .. -.-.
end

false && begin  # note
* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code
end


function unmorse -d "Convert Morse code to text [e.g., '... --- ...' -> 'SOS'] (filter)"
    python3 -S -c "
import sys

MORSE_CODE = {
    '.-': 'A', '-...': 'B', '-.-.': 'C', '-..': 'D', '.': 'E', '..-.': 'F',
    '--.': 'G', '....': 'H', '..': 'I', '.---': 'J', '-.-': 'K', '.-..': 'L',
    '--': 'M', '-.': 'N', '---': 'O', '.--.': 'P', '--.-': 'Q', '.-.': 'R',
    '...': 'S', '-': 'T', '..-': 'U', '...-': 'V', '.--': 'W', '-..-': 'X',
    '-.--': 'Y', '--..': 'Z',
    '-----': '0', '.----': '1', '..---': '2', '...--': '3', '....-': '4',
    '.....': '5', '-....': '6', '--...': '7', '---..': '8', '----.': '9',
    '.-.-.-': '.', '--..--': ',', '..--..': '?', '.----.': '\'', '-.-.--': '!',
    '-..-.': '/', '-.--.': '(', '-.--.-': ')', '.-...': '&', '---...': ':',
    '-.-.-.': ';', '-...-': '=', '.-.-.': '+', '-....-': '-', '..--.-': '_',
    '.-..-.': '\"', '...-..-': '\$', '.--.-.': '@', '/': ' '
}

for line in sys.stdin:
    # Split Morse code into words, then letters
    decoded = []
    for word in line.strip().split(' / '):
        decoded_word = []
        for code in word.split():
            decoded_word.append(MORSE_CODE.get(code, ''))
        decoded.append(''.join(decoded_word))
    print(' '.join(decoded))
"
end
