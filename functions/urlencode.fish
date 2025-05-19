false && begin  # example
    % echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
    % echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_\(programming_language\)
end


function urlencode -d "URL-encode input (filter)"
    python3 -c "
import sys
import urllib.parse

try:
    text = sys.stdin.read().strip()
    print(urllib.parse.quote(text))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end
