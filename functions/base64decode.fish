false && begin  # example
    % echo "aGVsbG8=" | base64decode
    hello

    % echo "aGVsbG8=" | base64decode | base64encode
    aGVsbG8\=
end


function base64decode -d "Base64 decode (filter)"
    python3 -c "
import base64
import sys

b64 = sys.stdin.read().rstrip('\r\n')
result = base64.b64decode(b64.encode()).decode()
print(result)
"
end
