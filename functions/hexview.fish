false && begin  # example
    % echo "Éva" | hexview
    ÉC9 v76 a61 ␤0A

    % echo -n "Éva" | hexview
    ÉC9 v76 a61
    # echo -n: no newline character

    % echo "Éva" | hexview bin
    .C3 .89 v76 a61 ␤0A
end

false && begin  # note
This filter is **made for text input** that may contain non-ASCII characters.
For binary files, use a proper hex editor.

You can use it 2 modes:

* text mode (default)
* binary mode

Tab, newline, carriage return and space characters are made visible with Unicode characters.

In text mode, in front of a hex value it also shows the character for easier identification.
If you have non-ASCII characters in your input, you\'d better switch to binary mode.
In binary mode, the input is processed as a byte stream. Non-printable characters appear as a dot \(`.`\).
end


function hexview -d "Show hex values of the input (filter)"
    set -l bin_mode 0
    if test "$argv[1]" = "bin"
        set bin_mode 1
    end

    python3 -S -c "
import sys

bin_mode = bool($bin_mode)  # True or False

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

def show_byte(code: int) -> char:
    if code == 9:
        return TAB
    elif code == 10:
        return NEWLINE
    elif code == 13:
        return CARRIAGE_RETURN
    elif code == 32:
        return SPACE
    elif 32 < code <= 126:
        return chr(code)
    else:
        return '.'

if not bin_mode:  # text mode
    for line in sys.stdin:
        print(' '.join(f'{show_char(c)}{ord(c):02X}' for c in line), end='')
        print()
    #
else:  # bin_mode
    for line in sys.stdin.buffer:
        print(' '.join(f'{show_byte(b)}{b:02X}' for b in line), end='')
        print()
    #
#
"
end
