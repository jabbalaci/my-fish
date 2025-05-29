false && begin  # example
    % cat text.txt
    aaa
    bbb
    ccc

    % cat text.txt | joinlines
    aaabbbccc

    % cat text.txt | joinlines ", "
    aaa, bbb, ccc
end


function joinlines --argument sep -d "Join the input lines with a separator (filter)"
    python3 -S -c "
import sys

sep = '$sep'

lines = sys.stdin.read().splitlines()
print(sep.join(lines))

# for line in sys.stdin:
    # line = line.rstrip('\r\n')
    # print(line + sep, end='')
# print()
"
end
