function removesuffix --argument suffix -d "Remove suffix (filter)"
    if test -z "$suffix"
        echo "Error: suffix argument is required" >&2
        return 1
    end

	python3 -c "
import sys

suffix = '$suffix'
for line in sys.stdin:
    line = line.rstrip('\r\n')
    print(line.removesuffix(suffix))
"

end
