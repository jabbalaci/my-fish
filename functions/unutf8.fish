false && begin  # example
    % echo "\xc3\x89\x76\x61" | unutf8
    Éva

    % echo "\xc3\x89\x76\x61" | unutf8 | utf8
    \xc3\x89\x76\x61\x0a
    # where \x0a is the newline character \('\n'\)
end

false && begin  # note
Decode a UTF-8-encoded byte array.
end


function unutf8 -d "Decode the input with UTF-8 (filter)"
    python3 -S -c "
import sys
import codecs

def decode_utf8_escaped(s):
    # Decode escaped hex sequences (like '\x61') into their UTF-8 characters
    return codecs.escape_decode(s)[0].decode('utf-8')

s = sys.stdin.read()
try:
    decoded = decode_utf8_escaped(s).rstrip('\r\n')
    print(decoded)
except UnicodeDecodeError:
    print(f'Error: invalid UTF-8 escape sequence', file=sys.stderr)
    sys.exit(1)
"
end
