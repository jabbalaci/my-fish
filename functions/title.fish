false && begin  # example
    % echo "hello world" | title
    Hello World
end


function title -d "Convert to title case (filter)"
    python3 -S -c "
import sys

for line in sys.stdin:
    print(line.title(), end='')
"
end
