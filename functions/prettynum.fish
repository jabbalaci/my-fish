false && begin  # example
    % echo 12345679 | prettynum
    12,345,679

    % echo 12345679 | prettynum '_'
    12_345_679
end


function prettynum -d "Prettify a number (filter)"
    set -l sep ","
    if test -n "$argv[1]"
        set sep $argv[1]
    end
    python3 -c "
import sys

try:
    n = int(sys.stdin.read())
    s = f'{n:,}'.replace(',', '$sep')
    print(s)
except:
    print('Error: provide a decimal number', file=sys.stderr)
    sys.exit(1)
"
end
