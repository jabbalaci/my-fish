function replace -d "Replace <old> <new> (filter)"
    set -l old $argv[1]
    set -l new $argv[2]
    if test -z "$old" -o -z "$new"
        echo "Error: <old> and <new> arguments are required" >&2
        return 1
    end

    python3 -c "
import sys

s = sys.stdin.read()
print(s.replace('$old', '$new'), end='')
"
end
