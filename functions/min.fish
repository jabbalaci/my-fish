false && begin  # example
    % cat file.txt
    3
    1
    2

    % cat file.txt | min
    1

    % cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    % cat numbers.txt | min --float
    169.69
end

false && begin  # note
We suppose that there\'s one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default), `--float` and `--str`.
end


function min --argument data_type -d "Find the smallest element [default type: int] (filter)"
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
        mini = value
    else:
        if value < mini:
            mini = value
        #
    #
#
print(mini)
"
end
