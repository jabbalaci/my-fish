false && begin  # example
    % echo "Fish shell" | zalgo1
    Fǐśħ śĥéŀĺ

    % echo "Fish shell" | zalgo2
    F̌i̖s̕ȟ ͎sͅhel̬l͜

    % echo "Fish shell" | zalgo3
    F̪̘҄҃̚i̗̙̖ͨs̱̰ͮ҄҉̚̚h̋̈͐҈̙̗҅ š̖̙ͫ͢h̜̱̘̀҃e͈̠̐҅҉̘l̵̘̃̉҄l͓̘̘
end

false && begin  # note
It adds glitchy characters to the text.

* zalgo1: light
* zalgo2: medium
* zalgo3: aggressive
end


function zalgo1 -d "Add funny accents to characters [a -> ấ, etc.] (filter)"
    python3 -S -c "
from random import choice
import sys

d = {
    'a': ['à', 'á', 'â', 'ã', 'ä', 'å', 'ā', 'ă', 'ą', 'ǎ', 'ȁ', 'ȃ', 'ạ', 'ả', 'ấ', 'ầ', 'ẩ', 'ẫ', 'ậ', 'ắ', 'ằ', 'ẳ', 'ẵ', 'ặ'],
    'e': ['è', 'é', 'ê', 'ë', 'ē', 'ĕ', 'ė', 'ę', 'ě', 'ȅ', 'ȇ', 'ẹ', 'ẻ', 'ẽ', 'ế', 'ề', 'ể', 'ễ', 'ệ'],
    'i': ['ì', 'í', 'î', 'ï', 'ĩ', 'ī', 'ĭ', 'į', 'ǐ', 'ȉ', 'ȋ', 'ị', 'ỉ'],
    'o': ['ò', 'ó', 'ô', 'õ', 'ö', 'ø', 'ō', 'ŏ', 'ő', 'ǒ', 'ȍ', 'ȏ', 'ọ', 'ỏ', 'ố', 'ồ', 'ổ', 'ỗ', 'ộ', 'ớ', 'ờ', 'ở', 'ỡ', 'ợ'],
    'u': ['ù', 'ú', 'û', 'ü', 'ũ', 'ū', 'ŭ', 'ů', 'ű', 'ų', 'ǔ', 'ǖ', 'ǘ', 'ǚ', 'ǜ', 'ȕ', 'ȗ', 'ụ', 'ủ', 'ứ', 'ừ', 'ử', 'ữ', 'ự'],
    'c': ['ç', 'ć', 'ĉ', 'ċ', 'č'],
    'n': ['ñ', 'ń', 'ņ', 'ň', 'ŋ'],
    's': ['ś', 'ŝ', 'ş', 'š'],
    'z': ['ź', 'ż', 'ž'],
    'l': ['ĺ', 'ļ', 'ľ', 'ŀ', 'ł'],
    'r': ['ŕ', 'ŗ', 'ř'],
    'd': ['đ', 'ď'],
    't': ['ţ', 'ť', 'ŧ'],
    'g': ['ĝ', 'ğ', 'ġ', 'ģ'],
    'h': ['ĥ', 'ħ'],
    'j': ['ĵ'],
    'k': ['ķ', 'ĸ'],
    'w': ['ŵ'],
    'y': ['ý', 'ÿ', 'ŷ'],
}

def change(c):
    li = d.get(c, [c])
    return choice(li)

for line in sys.stdin:
    new_line = ''.join(change(c) for c in line)
    print(new_line, end='')
"
end
