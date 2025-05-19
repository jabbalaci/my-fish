false && begin  # example
    % echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_\(programming_language\)
    % echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
end


function urldecode -d "URL-decode input (filter)"
    python3 -c "
import sys
import urllib.parse

try:
    text = sys.stdin.read().strip()
    print(urllib.parse.unquote(text))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end
