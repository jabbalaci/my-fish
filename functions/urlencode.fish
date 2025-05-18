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
