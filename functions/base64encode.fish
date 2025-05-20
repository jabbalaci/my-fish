false && begin  # example
    % echo "hello" | base64encode
    aGVsbG8\=

    % echo "hello" | base64encode | base64decode
    hello
end


function base64encode -d "Base64 encode (filter)"
    pypy3 -c "
import base64
import sys

s = sys.stdin.read().rstrip('\r\n')
data = base64.b64encode(s.encode())
print(data.decode())
"
end
