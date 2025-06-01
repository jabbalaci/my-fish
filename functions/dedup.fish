false && begin  # example
    % cat file.txt
    dd
    bb
    dd  # duplicate
    aa
    aa  # duplicate
    bb  # duplicate

    % cat file.txt | dedup
    dd
    bb
    aa
end

false && begin  # note
In the first example, `duplicate` is just a note, not part of the file.
end


function dedup -d "Remove duplicate lines and keep the original order (filter)"
    python3 -S -c "
import sys

found = set()

for line in sys.stdin:
    line = line.rstrip('\r\n')
    if line not in found:
        print(line)
        found.add(line)
    #
#
"
end
