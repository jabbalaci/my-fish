false && begin  # example
    % echo MMXXV | unroman
    2025

    % echo MMXXV | unroman | roman
    MMXXV
end


function unroman -d "Convert Roman numeral to number (filter)"
    # Read from stdin if no argument
    if test (count $argv) -eq 0
        while read -l roman
            unroman $roman
        end
        return
    end

    # Validate input
    set -l roman (string upper $argv[1])
    if ! string match -qr '^[IVXLCDM]+$' -- $roman
        echo "Error: Input must be a valid Roman numeral (I, V, X, L, C, D, M)" >&2
        return 1
    end

    # Conversion logic
    set -l total 0
    set -l prev 0

    for c in (string split "" $roman | tac)
        switch $c
            case I; set val 1
            case V; set val 5
            case X; set val 10
            case L; set val 50
            case C; set val 100
            case D; set val 500
            case M; set val 1000
        end

        if test $val -lt $prev
            set total (math $total - $val)
        else
            set total (math $total + $val)
        end
        set prev $val
    end

    echo $total
end
