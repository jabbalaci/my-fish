false && begin  # example
```text
    % alphabet
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
    !\"#\$%&\'\(\)*+,-./:;\<\=\>?@[\\]^_`{|}~
    0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#\$%&\'\(\)*+,-./:;\<\=\>?@[\\]^_`{|}~
```
end

false && begin  # note
It prints the alphabet \(lowercase, uppercase letters\), digits and printable characters.
end


function alphabet -d "Print the alphabet (lowercase, uppercase, digits, printable characters)"
    python3 -S -c "
import string

print(string.ascii_lowercase)
print(string.ascii_uppercase)
print(string.ascii_letters)
print(string.punctuation)
print(string.printable.rstrip())  # non-visible whitespaces are removed from the end
"
end

