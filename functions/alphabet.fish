function alphabet -d "Print the alphabet (lowercase, uppercase, digits, printable characters)"
    pypy3 -c "
import string

print(string.ascii_lowercase)
print(string.ascii_uppercase)
print(string.ascii_letters)
print(string.punctuation)
print(string.printable.rstrip())  # non-visible whitespaces are removed from the end
"
end

# "abcdefghijklmnopqrstuvwxyz"
# "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
# '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
# '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ \t\n\r\x0b\x0c'
