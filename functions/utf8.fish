false && begin  # example
    % echo -n "Éva" | utf8
    \xc3\x89\x76\x61

    % echo -n "Éva" | utf8 | unutf8
    Éva
end

false && begin  # note
Encode the input to a UTF-8-encoded byte array.
end


function utf8 -d "Encode the input with UTF-8 (filter)"
    python3 -S -c "
import sys

for line in sys.stdin.buffer:
    for b in line:
        print(f'\\\\x{b:02x}', end='')
    #
#
print()
"
end
