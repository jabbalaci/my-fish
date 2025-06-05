false && begin  # example
    % cat file.txt
    3
    1
    2

    % cat file.txt | sum
    6

    % cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    % cat numbers.txt | sum --float
    2009.41
end

false && begin  # note
`sum` is an existing program in the `coreutils` package. If you need that,
then give this function a different name.

We suppose that there\'s one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default) and `--float`.
end


function sum --argument data_type -d "Sum of the values in the input (filter)"
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

total = 0

for line in sys.stdin:
    value = $dtype(line)
    total += value
#
print(total)
"
end

# LC_ALL=C datamash sum 1
