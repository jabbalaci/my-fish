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


function zalgo3 -d "Add Zalgo (glitchy) characters (filter)"
    python3 -S -c "
import sys
import random

# Combining diacritical mark ranges
zalgo_up = [chr(i) for i in range(0x0300, 0x036F + 1)]
zalgo_mid = [chr(i) for i in range(0x0483, 0x0489 + 1)]
zalgo_down = [chr(i) for i in range(0x0316, 0x031B + 1)]

def zalgo_char(c):
    if c.isspace():
        return c
    num_up = random.randint(1, 3)
    num_mid = random.randint(0, 2)
    num_down = random.randint(1, 2)
    return c + ''.join(random.choices(zalgo_up, k=num_up)) + \
               ''.join(random.choices(zalgo_mid, k=num_mid)) + \
               ''.join(random.choices(zalgo_down, k=num_down))

for line in sys.stdin:
    print(''.join(zalgo_char(c) for c in line.rstrip()))
"
end
