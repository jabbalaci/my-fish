false && begin  # example
    % echo "12345678" | shuffle
    14857362

    % echo "12345678" | shuffle
    12563487
end


function shuffle -d "Shuffle characters in each line (filter)"
    python3 -S -c "
import random
import sys

for line in sys.stdin:
    line = line.rstrip('\r\n')
    chars = list(line)
    random.shuffle(chars)
    result = ''.join(chars)
    print(result)
"
end
