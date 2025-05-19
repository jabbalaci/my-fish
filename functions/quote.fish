false && begin  # example
    % echo "largest prime below 1 million" | quote
    largest+prime+below+1+million
    % echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
end


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
