false && begin  # example
    % echo "hEllO" | isascii
    true

    % echo "helló" | isascii
    false
    Line 1:
    helló
end

function isascii -d "Check if a text is ASCII only (filter)"
python3 -S -c "
import sys

for idx, line in enumerate(sys.stdin, start=1):
    for c in line:
        if ord(c) > 127:
            print('false')
            print(f'Line {idx}:')
            print(line, end='')
            sys.exit(0)
        #
    #
#
print('true')
"
end
