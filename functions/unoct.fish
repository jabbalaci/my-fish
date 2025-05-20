false && begin  # example
    % echo 755 | unoct
    493

    % echo 755 | unoct | oct
    0o755
end


function unoct -d "Octal number to decimal (filter)"
    pypy3 -c "
import sys

try:
    s = sys.stdin.read()
    result = int(s, 8)
    print(result)
except:
    print('Error: provide an octal number', file=sys.stderr)
    sys.exit(1)
"
end
