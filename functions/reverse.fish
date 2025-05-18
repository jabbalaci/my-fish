function reverse -d "Reverse a string (filter)"
    python3 -c "
import sys

s = sys.stdin.read().rstrip('\r\n')
print(s[::-1])
"
end
