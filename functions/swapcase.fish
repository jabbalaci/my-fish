function swapcase -d "Swap lower- and uppercase (filter)"
    python3 -c "
import sys

s = sys.stdin.read()
print(s.swapcase(), end='')
"
end
