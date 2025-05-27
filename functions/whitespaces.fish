false && begin  # example
    % cat Makefile
    cat:
            cat Makefile

    % cat Makefile | whitespaces
    cat:␤
    ⭾cat␣Makefile␤
end

false && begin  # note
Tab, newline, carriage return and space characters are made visible with Unicode characters.
end


function whitespaces -d "Show whitespaces (filter)"
    python3 -S -c "
import sys

char = str

TAB = '⭾'
NEWLINE = '␤'
CARRIAGE_RETURN = '␍'
SPACE = '␣'

def show_char(c: char) -> char:
    code = ord(c)
    if code == 9:
        return TAB
    elif code == 10:
        return NEWLINE
    elif code == 13:
        return CARRIAGE_RETURN
    elif code == 32:
        return SPACE
    else:
        return c

for line in sys.stdin:
    print(''.join(show_char(c) for c in line))
"
end
