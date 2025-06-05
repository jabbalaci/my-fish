false && begin  # example
    % cat file.txt
    1
    3
    2

    % cat file.txt | max
    3

    % cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    % cat numbers.txt | max --float
    492.34
end

false && begin  # note
We suppose that there\'s one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default), `--float` and `--str`.
end


function max --argument data_type -d "Find the largest element [default type: int] (filter)"
    set -l dtype "int"  # default
    if test -n "$data_type"
        switch $data_type
            case '--float'
                set dtype "float"
            case '--int'
                set dtype "int"
            case '--str'
                set dtype "str"
            case '*'
                echo "error: unsupported data type" >&2
                return 1
        end
    end

    python3 -S -c "
import sys

for idx, line in enumerate(sys.stdin, start=1):
    value = $dtype(line.rstrip('\r\n'))
    if idx == 1:
        maxi = value
    else:
        if value > maxi:
            maxi = value
        #
    #
#
print(maxi)
"
end
