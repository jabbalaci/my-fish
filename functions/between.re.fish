false && begin  # example
    % cat file.txt
    aaa
    ONE
    bbb
    ccc
    TWO
    ddd

    % cat file.txt | between.re ONE TWO
    ONE
    bbb
    ccc
    TWO

    % cat file.txt | between.re ONE TWO | skip 1 | skip last
    bbb
    ccc
end

false && begin  # note
There\'s a similar filter called `between`, which requires two line numbers
and prints all the lines between these two values (incl.).

Here you need to specify two regular expressions instead of two line numbers.

It reads the whole input, thus don\'t use it with huge files.
end


function between.re -d "Print lines between two regex matches [inclusive] (filter)"
    if test (count $argv) -lt 2
        echo "Usage: between.re <start_regex> <end_regex>" >&2
        return 1
    end

    set -l start_regex $argv[1]
    set -l end_regex $argv[2]

    python3 -S -c "
import re
import sys

start_re = re.compile('$start_regex')
end_re = re.compile('$end_regex')
start_idx = end_idx = 0

lines = sys.stdin.readlines()
for idx, line in enumerate(lines, start=1):
    if start_re.search(line):
        if not start_idx:
            start_idx = idx
        #
    #
    if end_re.search(line):
        if not end_idx:
            end_idx = idx
        #
    #
#
if not start_idx and end_idx:
    start_idx = 1
if start_idx and not end_idx:
    end_idx = 2 ** 31 - 1
if start_idx > end_idx:
    sys.stderr.write('Error: start index is larger than end index\\n')
    sys.exit(1)
# else, if start_idx <= end_idx
# print(f'start idx: {start_idx}')
# print(f'end idx: {end_idx}')
lines.insert(0, '')  # thus first line's index becomes 1
result = lines[start_idx:end_idx+1]
sys.stdout.write(''.join(result))
"
end
