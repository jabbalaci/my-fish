false && begin  # example
    % echo "Hello World" | swapcase
    hELLO wORLD
end


function swapcase -d "Swap lower- and uppercase (filter)"
    python3 -S -c "
import sys

s = sys.stdin.read()
print(s.swapcase(), end='')
"
end
