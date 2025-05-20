false && begin  # example
    % cat main.py
    # x = 1
    # y = 2

    % cat main.py | removeprefix "# "
    x = 1
    y = 2
end


function removeprefix --argument prefix -d "Remove prefix (filter)"
    if test -z "$prefix"
        echo "Error: prefix argument is required" >&2
        return 1
    end

	python3 -S -c "
import sys

prefix = '$prefix'
for line in sys.stdin:
    print(line.removeprefix(prefix), end='')
"

end
