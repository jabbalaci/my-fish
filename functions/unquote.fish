false && begin  # example
    % echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million

    % echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
end


function unquote -d "Decode GET-style quoted text (filter)"
    pypy3 -c "
import sys
import urllib.parse

try:
    text = sys.stdin.read().strip()
    print(urllib.parse.unquote_plus(text))
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
"
end
