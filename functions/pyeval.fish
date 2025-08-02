false && begin  # example
    % echo 8 - 5 | pyeval
    3

    % echo "2**20" | pyeval
    1048576

    % echo "'laci'.upper()" | pyeval
    LACI

    % echo "r.randint(1, 6)" | pyeval
    2
end

false && begin  # note
The input is evaluated with Python\'s `eval\(\)`
function, so BE CAREFUL what you pass to it!
end


function pyeval -d "Evaluate an expression with Python"
    python3 -S -c "
import math
import random as r
import sys

for line in sys.stdin:
    line = line.rstrip("\r\n")
    value = eval(line)
    print(value)
    "
end

