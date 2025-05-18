function p.ext -d "Path [/usr/lib/a.tar.gz -> .gz] (filter)"
    python3 -c "
import sys
from pathlib import Path

fname = sys.stdin.read().strip()
p = Path(fname)
print(p.suffix)
"
end
