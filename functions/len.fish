function len -d "Length of a string (filter)"
    python3 -c "
import sys

s = sys.stdin.read().rstrip('\r\n')
print(len(s))
"
end
