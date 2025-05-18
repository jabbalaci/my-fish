function quote -d "Create GET-style quoted text (filter)"
    python3 -c "
import sys
import urllib.parse

try:
    text = sys.stdin.read().strip()
    print(urllib.parse.quote_plus(text))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end
