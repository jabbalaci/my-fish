false && begin  # example
    % cat file.txt
    1
    one
    2
    two

    % cat file.txt | every 2
    one
    two
end


function every --argument n -d "Take every <n>th line of the input (filter)"
	if test -z "$n"
	    set n 1
	end

    python3 -S -c "
import sys

n = int($n)

for idx, line in enumerate(sys.stdin, start=1):
    if idx % n == 0:
        print(line, end='')
    #
#
"
end
