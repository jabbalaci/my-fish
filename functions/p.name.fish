false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
end


function p.name -d "Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py] (filter)"
    python3 -S -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
print(p.name)
"
end
