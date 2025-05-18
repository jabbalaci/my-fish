function mixup -d "Mix up inner letters of each word, keeping first/last intact (filter)"
    python3 -c "
import random
import sys

def mix_word(word: str) -> str:
    if len(word) <= 3:
        return word  # Too short to mix
    first, *inner, last = word
    random.shuffle(inner)
    return first + ''.join(inner) + last

# lines = sys.stdin.readlines()
# streams line-by-line, keeping '\n' at the end of a line:
for line in sys.stdin:
    word = ''
    for c in line:
        if c.isalpha():
            word += c
        else:
            if word:
                sys.stdout.write(mix_word(word))
                word = ''
            sys.stdout.write(c)
    #
    if word:
        print(word)
#
"
end
