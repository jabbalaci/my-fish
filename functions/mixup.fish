false && begin  # example
    % echo "This is just a sentence." | mixup
    Tihs is just a snetcnee.

    % cat fish.txt | mixup
    Fish \(feldirny iarncitetve shlel; syeilztd in lcworasee\) is a Uinx-like slhel wtih a foucs
    on icintiettravy and utilaisby. Fish is dngeised to be fatreue-rich by dfaulet,
    reathr tahn highly clfrguoaibne, and does not ardehe to PISOX shlel sdartdans by desgin.
end

false && begin  # note
Interestingly, if you mix up the inner letters of words, but you keep the first
and last letters intact, the text is still rather readable.

The readable version of the 2nd example is [here]\(https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FFish_%28Unix_shell%29\).
end


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
