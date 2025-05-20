false && begin  # example
    % cat main.c
    #include <stdio.h>

    int main\(\)
    {
        printf\("hello\n"\);

        return 0;
    }
    % cat main.c | nonempty
    #include <stdio.h>
    int main\(\)
    {
        printf\("hello\n"\);
        return 0;
    }
end


function nonempty -d "Remove empty lines (filter)"
    python3 -c "
import sys

lines = sys.stdin.read().splitlines()
for l in lines:
    if l.strip():
        print(l)
"
end
