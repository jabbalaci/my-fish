false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
end


function p.parent -d "Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5] (filter)"
    python3 -S -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
print(p.parent)
"
end
