function roman --description "Convert number to Roman numeral [1-3999] (filter)"
    # Read from stdin if no argument
    if test (count $argv) -eq 0
        while read -l num
            roman $num
        end
        return
    end

    # Validate input
    if ! string match -qr '^[0-9]+$' -- $argv[1]
        echo "Error: Input must be a positive integer (1-3999)" >&2
        return 1
    end

    set -l num $argv[1]
    if test $num -lt 1 -o $num -gt 3999
        echo "Error: Number must be between 1 and 3999" >&2
        return 1
    end

    # Conversion logic
    set -l values 1000 900 500 400 100 90 50 40 10 9 5 4 1
    set -l symbols M CM D CD C XC L XL X IX V IV I
    set -l result ""

    for i in (seq (count $values))
        while test $num -ge $values[$i]
            set -a result $symbols[$i]
            set num (math $num - $values[$i])
        end
    end

    string join "" $result
end
