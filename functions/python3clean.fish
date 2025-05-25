false && begin  # example
    % python3clean
    Python 3.13.3 \(main, Apr  9 2025, 07:44:25\) [GCC 14.2.1 20250207] on linux
    \>\>\>
end

false && begin  # note
By default, the Python 3 REPL starts like this:

```shell
    % python3
    Python 3.13.3 \(main, Apr  9 2025, 07:44:25\) [GCC 14.2.1 20250207] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    \>\>\>
```

Notice the extra line that starts with "Type...". We don\'t need that line.
This function removes it.

Tip: this function has a long name so I suggest putting an alias on it.
end


function python3clean -d "Start the Python 3 REPL without the extra info line"
    set -l pyline (python3 -S -c "import sys; print(f'Python {sys.version} on {sys.platform}')")
    echo $pyline
    python3 -q
end
