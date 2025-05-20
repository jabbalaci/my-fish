false && begin  # example
    % echo "Hello World" | randomcase
    heLLo woRLd

    % echo "Hello World" | randomcase
    HEllo WorLD
end


function randomcase -d "Alternate case randomly (filter)"
    python3 -S -c "
import sys
import random

def randomize(s):
    out = []
    for c in s:
        if c.isalpha():
            out.append(c.upper() if random.random() > 0.5 else c.lower())
        else:
            out.append(c)
    return ''.join(out)

for line in sys.stdin:
    print(randomize(line.rstrip('\r\n')))
"
end
