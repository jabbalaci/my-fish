function ex.urls -d "Extract all URLs (filter)"
    python3 -c "
import re
import sys

html = sys.stdin.read()
urls = re.findall(
    r'https?://(?:[a-zA-Z0-9\$-_@.&+!*\(\),]|%[0-9a-fA-F]{2})+',
    html
)
for url in urls:
    print(url)
"
end

# r'http[s]?://(?:[a-zA-Z]|[0-9]|[\$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
# r'https?://(?:[a-zA-Z0-9\$-_@.&+!*\(\),]|%[0-9a-fA-F]{2})+',
