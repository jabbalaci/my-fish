false && begin  # example
    % cat text.txt
    aa
    bbb
    aa
    ccc
    bbb
    aa

    % cat text.txt | uniq_keep_order
    aa
    bbb
    ccc
end

false && begin  # note
The Unix \'uniq\' command does not detect repeated lines unless they are adjacent.
In order to use \'uniq\', you must sort the input.
This filter solves both problems: no need to sort \(we keep the original order\),
and duplicates don\'t have to be adjacent.
end

function uniq_keep_order -d "Remove duplicated lines and keep the order (filter)"
python3 -S -c "
import sys

seen = set()
for line in sys.stdin:
    if line not in seen:
        print(line, end='')
        seen.add(line)
"
end
