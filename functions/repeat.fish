function repeat --argument n -d "Repeat a text <n> times (filter)"
    if test -z "$n"
        echo "Error: n argument is required" >&2
        return 1
    end
    if test "$n" -lt 1
        return
    end

    read -l input

    for i in (seq 1 $n)
        echo -n $input
    end
    echo
end
