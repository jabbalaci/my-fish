false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
end


function p.allext -d "Path [/usr/lib/a.tar.gz -> .tar.gz] (filter)"
    python3 -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
fname = p.name
if (pos := fname.find('.')) == -1:
    print("")
else:
    print(fname[pos:])
"
end
