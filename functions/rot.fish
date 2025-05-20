false && begin  # example
    % echo "Fish" | rot 2
    Hkuj

    % echo "Fish" | rot -2
    Dgqf

    % echo "Fish" | rot 2 | rot -2
    Fish

    % echo "Fish" | rot 13
    Svfu

    % echo "Fish" | rot 13 | rot13
    Fish
end

false && begin  # note
[Caesar\'s code.]\(https://en.wikipedia.org/wiki/Caesar_cipher\) Letters of the English
alphabet are rotated by `n` positions. `n` can be negative too, in which case letters
are rotated left.

[ROT13]\(https://en.wikipedia.org/wiki/ROT13\) is a special case of the Caesar cipher.
end


function rot --argument n -d "Rotate letters with with `<n>` positions (filter)"
    if test -z "$n"
        echo "Usage: rot <n>" >&2
        return 1
    end

    pypy3 -c "
import sys

try:
    rot = int('$n')
except:
    print('Error: n must be an integer', file=sys.stderr)
    sys.exit(1)

def caesar_char(c, rot):
    if 'a' <= c <= 'z':
        return chr((ord(c) - ord('a') + rot) % 26 + ord('a'))
    elif 'A' <= c <= 'Z':
        return chr((ord(c) - ord('A') + rot) % 26 + ord('A'))
    else:
        return c

for line in sys.stdin:
    result = ''.join(caesar_char(c, rot) for c in line)
    print(result, end='')
"
end
