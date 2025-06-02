false && begin  # example
    % cat main.py
    x = 1 # variable
    y = 2 # variable

    % cat main.py | removesuffix " # variable"
    x = 1
    y = 2
end


function removesuffix --argument suffix -d "Remove suffix (filter)"
    if test -z "$suffix"
        echo "Error: suffix argument is required" >&2
        return 1
    end

	python3 -S -c "
import sys

suffix = '$suffix'
for line in sys.stdin:
    line = line.rstrip('\r\n')
    print(line.removesuffix(suffix))
"

end

# printf "%s\n" foofoo BARfoo Bazfoo | string replace -r 'foo$' ''
