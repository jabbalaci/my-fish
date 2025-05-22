false && begin  # example
    % echo "hello" | reverse
    olleh

    % echo "hello" | reverse | reverse
    hello
end

false && begin  # note
If you pass it the content of a text file, it reads the whole content of the
file and reverses the whole content.

If you want to reverse a file line-by-line, use the `rev` command from the `util-linux` package:

```shell
    \$ cat book.txt | rev
```
end


function reverse -d "Reverse a string (filter)"
    python3 -S -c "
import sys

s = sys.stdin.read().rstrip('\r\n')
print(s[::-1])
"
end
