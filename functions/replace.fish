false && begin  # example
    % echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
end


function replace -d "Replace `<old>` with `<new>` (filter)"
    if test (count $argv) -ne 2
        echo "Error: <old> and <new> arguments are required" >&2
        return 1
    end
    set -l old $argv[1]
    set -l new $argv[2]

    python3 -S -c "
import sys

s = sys.stdin.read()
print(s.replace('$old', '$new'), end='')
"
end
