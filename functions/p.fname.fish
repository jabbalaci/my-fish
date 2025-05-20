false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
end


function p.fname -d "Path [/usr/lib/stuff.tar.gz -> stuff] (filter)"
    python3 -S -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
fname = p.name
if (pos := fname.find('.')) == -1:
    print(fname)
else:
    print(fname[:pos])
"
end
