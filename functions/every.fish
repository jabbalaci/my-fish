false && begin  # example
    % cat file.txt
    1
    one
    2
    two
    3
    three

    # take every second line
    % cat file.txt | every 2
    one
    two
    three

    # take every second line from the first line
    % cat file.txt | every 2 --from 1
    1
    2
    3

    # take every second line from the fourth line
    % cat file.txt | every 2 --from 4
    two
    three
end

false && begin  # note
The index of the 1st line is 1.
end


function every --argument n -d "Take every <n>th line, optionally starting from <from> (filter)"
    if test -z "$n"
        set n 1
    end

    # Parse optional `--from` argument (defaults to $n if not given)
    set -l from $n
    if set -l idx (contains -i -- "--from" $argv)
        set from $argv[(math $idx + 1)]
    end

    python3 -S -c "
import sys

n = int('$n')
from_line = int('$from')

for idx, line in enumerate(sys.stdin, start=1):
    if idx < from_line:
        continue
    # else:
    if (idx - from_line) % n == 0:
        print(line, end='')
    #
#
"
end
