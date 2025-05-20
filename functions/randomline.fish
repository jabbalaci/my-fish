false && begin  # example
    % cat 123.txt
    one
    two
    three
    % cat 123.txt | randomline
    two
    % cat 123.txt | randomline
    one
end


function randomline -d "Select a non-empty random line from input (filter)"
    python3 -c "
import random
import sys

lines = sys.stdin.readlines()
non_empty_lines = [line for line in lines if line.strip()]

if non_empty_lines:
    print(random.choice(non_empty_lines), end='')
"
end
