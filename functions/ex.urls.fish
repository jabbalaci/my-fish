false && begin  # example
    % curl -s https://fishshell.com/ | ex.urls
    https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js
    https://oss.maxcdn.com/respond/1.4.2/respond.min.js
    ...
end


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
