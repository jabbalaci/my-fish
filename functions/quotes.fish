false && begin  # example
    % echo "hello"
    hello

    % echo "hello" | quotes
    'hello'
end

false && begin  # note
Puts the input among quotes, making the beginning and the end of the input clearly visible.
end


function quotes -d "Add quotes around the input (filter)"
    python3 -S -c "
import sys

print('\'' + sys.stdin.read().rstrip('\r\n') + '\'')
"
end
