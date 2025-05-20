false && begin  # example
    % echo 123456 | filesize
    120.56 KB
end


function filesize -d "Convert filesize [bytes] to human-readable format (filter)"
    pypy3 -c "
import sys

def sizeof_fmt(num):
    for x in ['bytes', 'KB', 'MB', 'GB', 'TB']:
        if num < 1024.0:
            return '{0:.2f} {1}'.format(num, x)
        num /= 1024.0

try:
    bytes = int(sys.stdin.read())
    print(sizeof_fmt(bytes))
except:
    print('Error: provide a decimal number', file=sys.stderr)
    sys.exit(1)
"
end
