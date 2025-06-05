false && begin  # example
    % cat file.txt
    3
    5
    2

    % cat file.txt | prod
    30

    % cat numbers.txt
    230.35
    211.62
    269.94

    % cat numbers.txt | prod --float
    13158675.28998
end

false && begin  # note
We suppose that there\'s one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default) and `--float`.
end


function prod --argument data_type -d "Product of the values in the input (filter)"
    set -l dtype "int"  # default
    if test -n "$data_type"
        switch $data_type
            case '--float'
                set dtype "float"
            case '--int'
                set dtype "int"
            case '*'
                echo "error: unsupported data type" >&2
                return 1
        end
    end

    python3 -S -c "
import sys

product = 1

for line in sys.stdin:
    value = $dtype(line)
    product *= value
#
print(product)
"
end
