function lower -d "Convert to lowercase (filter)"
    # (1) with Fish
    # while read line
        # echo $line | string lower
    # end
    # return 0
    # (2) with Python
    python3 -c "
import sys

s = sys.stdin.read()
print(s.lower(), end='')
"
end
