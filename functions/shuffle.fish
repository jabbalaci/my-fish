function shuffle -d "Shuffle characters in each line (filter)"
    python3 -c "
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
