false && begin  # example
    % cat file.txt
    dd
    bb
    dd  # duplicate
    aa
    aa  # duplicate
    aa  # duplicate

    % cat file.txt | dups
    dd
    aa
    aa

    % cat file.txt | dups | dedup
    dd
    aa
end

false && begin  # note
In the first example, `duplicate` is just a note, not part of the file.

`dups` will print all the duplicates, even several times.
If you want to see a duplicate just once, then combine it with the `dedup` filter.
end


function dups -d "Find duplicate lines (filter)"
    python3 -S -c "
import sys

found = set()

for line in sys.stdin:
    line = line.rstrip('\r\n')
    if line in found:
        print(line)
    else:
        found.add(line)
    #
#
"
end
