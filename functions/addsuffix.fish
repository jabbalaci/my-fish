false && begin  # example
    % cat main.py
    x = 1
    y = 2
    % cat main.py | addsuffix " # variable"
    x = 1 # variable
    y = 2 # variable
end


function addsuffix --argument suffix -d "Add suffix to every line (filter)"
	if test -z "$suffix"
        echo "Error: suffix argument is required" >&2
        return 1
    end

	python3 -c "
import sys

suffix = '$suffix'
for line in sys.stdin:
    line = line.rstrip('\r\n')
    print(f'{line}{suffix}')
"
end
