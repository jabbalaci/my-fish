function longest -d "Length of the longest line (filter)"
    python3 -c "
import sys

maxi = -1
for line in sys.stdin:
    line = line.rstrip('\r\n')
    if len(line) > maxi:
        maxi = len(line)
    #
#
print(maxi)
"
end
