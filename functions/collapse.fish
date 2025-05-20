false && begin  # example
    % echo "    .aa    bb.    " | collapse
    .aa bb.

    % echo "    .aa    bb.    " | collapse | len
    7
end


function collapse -d "Collapse multiple whitespaces into single space (filter)"
    python3 -S -c "
import sys

for line in sys.stdin:
    line = line.rstrip('\r\n')
    result = ' '.join(line.split())
    print(result)
"
end
