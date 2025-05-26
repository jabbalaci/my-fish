false && begin  # example
    % echo "ab cd" | hexview
    a61 b62 ␣20 c63 d64 ␤0A

    % echo -n "ab cd" | hexview
    a61 b62 ␣20 c63 d64
    # echo -n: no newline character
end

false && begin  # note
In front of a hex value it also shows the character for easier identification.
If the character is non-printable, then a dot \(`.`\) is shown.
Tab, newline, carriage return and space characters are made visible with Unicode characters.
end


function hexview -d "Show hex values of the input (filter)"
    python3 -S -c "
import sys

TAB = '⭾'
NEWLINE = '␤'
CARRIAGE_RETURN = '␍'
SPACE = '␣'

def show(c):
    code = ord(c)
    if code == 9:
        return TAB
    elif code == 10:
        return NEWLINE
    elif code == 13:
        return CARRIAGE_RETURN
    elif code == 32:
        return SPACE
    elif 32 < code <= 127:
        return c
    else:
        return '.'

for line in sys.stdin:
    print(' '.join(f'{show(c)}{ord(c):02X}' for c in line), end='')
    print()
"
end
