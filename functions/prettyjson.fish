function _prettyjson -d "(internal function)"
    python3 -c "
import json
import sys

try:
    obj = json.load(sys.stdin)
    print(json.dumps(obj, indent=4, ensure_ascii=False))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end

false && begin  # example
    % cat example.json
    { "title": "Hackers", "year": 1995 }
    % cat example.json | prettyjson
    # the output is shown with `bat`
    % cat example.json | prettyjson cat
    {
        "title": "Hackers",
        "year": 1995
    }
    # the output is shown with `cat`
end

false && begin  # note
By default it wants to use the command `bat` \(make sure that it\'s installed\).
If you don\'t have `bat`, you can also use `cat`.
Here is a [screenshot]\(https://i.imgur.com/W93WyiO.png\) of the difference.
end


function prettyjson --argument prg -d "Pretty-print JSON (filter)"
    if test -z "$prg"
        set prg "bat"
    end

    set -l cmd
    switch $prg
        case "cat"
            set cmd "cat"
        case "bat"
            set cmd "bat"
        case "*"
            echo "Error: argument must be 'cat' or 'bat'" >&2
            return 1
    end

    if test "$cmd" = "bat"
        _prettyjson | bat -l json
    end
    if test "$cmd" = "cat"
        _prettyjson
    end
end
