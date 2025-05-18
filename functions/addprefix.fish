function addprefix --argument prefix -d "Add prefix to every line (filter)"
	if test -z "$prefix"
        echo "Error: prefix argument is required" >&2
        return 1
    end

	python3 -c "
import sys

prefix = '$prefix'
for line in sys.stdin:
    print(f'{prefix}{line}', end='')
"
end
