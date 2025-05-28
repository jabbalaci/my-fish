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


function zalgo2 -d "Add random Unicode glitches to text (filter)"
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
