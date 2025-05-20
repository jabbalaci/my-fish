false && begin  # example
    % cat main.c | typewriter
    #include <stdio.h>

    int main...
end

false && begin  # note
The content of the file is printed character by character,
with some delay, similarly to a typewriter.
end


function typewriter -d "Print like a typewriter (filter)"
    pypy3 -c "
import sys
import time

for c in sys.stdin.read():
    sys.stdout.write(c)
    sys.stdout.flush()
    try:
        time.sleep(0.1)
    except KeyboardInterrupt:
        print()
        break
"
end
