function collapse -d "Collapse multiple whitespaces into single space (filter)"
    python3 -c "
import sys

for line in sys.stdin:
    line = line.rstrip('\r\n')
    result = ' '.join(line.split())
    print(result)
"
end
