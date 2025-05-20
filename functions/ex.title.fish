false && begin  # example
    % curl -s https://fishshell.com/ | ex.title
    fish shell
end

false && begin  # note
It was extracted from `<title>fish shell</title>`.
end


function ex.title -d "Extract HTML title from a webpage (filter)"
    python3 -S -c "
import sys

original = sys.stdin.read()
html  = original.lower()

start = html.find('<title>')
end = html.find('</title>')
if (start != -1) and (end != -1) and (start < end):
    title = original[start+7:end]
    print(title.strip())
"
end
