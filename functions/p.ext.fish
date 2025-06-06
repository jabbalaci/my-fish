false && begin  # example
    % echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
end


function p.ext -d "Path [/usr/lib/a.tar.gz -> .gz] (filter)"
    python3 -S -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
print(p.suffix)
"
end

# ls ~/.config/functions/*.* | path extension | uniq
