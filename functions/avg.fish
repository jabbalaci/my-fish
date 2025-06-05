false && begin  # example
    % cat file.txt
    169.69
    230.35
    211.62
    269.94
    209.64
    492.34
    425.83

    % cat file.txt | avg
    287.06
end


function avg -d "Calculate the average (filter)"
    python3 -S -c "
import sys

mysum = 0
lines = 0

for line in sys.stdin:
    mysum += float(line)
    lines += 1
#
print('{0:.2f}'.format(mysum / lines))
"
end
