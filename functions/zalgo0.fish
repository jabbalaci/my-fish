# a less aggressive version of zalgo
function zalgo0 -d "Add random Unicode glitches to text [light] (filter)"
    python3 -c "
import random
import sys

for c in sys.stdin.read():
    sys.stdout.write(c)
    if random.random() > 0.1:
        for i in range(1):
            sys.stdout.write(chr(random.randint(0x300, 0x36F)))
"
end
