false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
end


function p.stem -d "Path [/usr/lib/python2.5/gopherlib.py -> gopherlib] (filter)"
    pypy3 -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
print(p.stem)
"
end
