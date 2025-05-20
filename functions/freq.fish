false && begin  # example
    % cat words.txt
    aa bb aa aa cc cc dd

    % cat words.txt | freq
    aa: 3
    cc: 2
    bb: 1
    dd: 1
end


function freq -d "Word frequency [simple, case-insensitive] (filter)"
    pypy3 -c "
import sys
from collections import defaultdict

d = defaultdict(int)

for line in sys.stdin:
    words = line.lower().split()
    for w in words:
        d[w] += 1
    #
#

for k, v in sorted(d.items(), key=lambda t: t[-1], reverse=True):
    print(f'{k}: {v}')
"
end
