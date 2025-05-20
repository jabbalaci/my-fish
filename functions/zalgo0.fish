false && begin  # example
    % echo "Fish shell" | zalgo0
    F̂i͕sͥh̐ ͍s͍h̶e̚l͇l͠

    % echo "Fish shell" | zalgo
    F̸̷̗̏̚ì̛͖s̞̗҆͠h͚҄҈̖̘ s̱̖̍ͪ҄̚h̭̹̳̘e̸ͥ҉҉̛̛l̗̖ͮl̤ͨ҈̙̚
end

false && begin  # note
It adds glitchy characters to the text. `zalgo0` is less
aggressive than `zalgo`.
end


function zalgo0 -d "Add random Unicode glitches to text [light] (filter)"
    python3 -S -c "
import random
import sys

for c in sys.stdin.read():
    sys.stdout.write(c)
    if random.random() > 0.1:
        for i in range(1):
            sys.stdout.write(chr(random.randint(0x300, 0x36F)))
"
end
