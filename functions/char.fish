false && begin  # example
    % char
    Char: a
    ---
    ASCII code:                   97
    Unicode code point \(hex\):     U+0061
    In binary:                    0110 0001
    Unicode name:                 LATIN SMALL LETTER A
    Category:                     Ll \(Lowercase Letter\)
    Uppercase:                    A
    Lowercase:                    a
    UTF-8:                        b'a' \(1 byte\)
    In binary:                    0110 0001
    Decomposition info:           None

    % char
    Char: á
    ---
    Unicode code point \(decimal\): 225
    Unicode code point \(hex\):     U+00E1
    In binary:                    1110 0001
    Unicode name:                 LATIN SMALL LETTER A WITH ACUTE
    Category:                     Ll \(Lowercase Letter\)
    Uppercase:                    Á
    Lowercase:                    á
    UTF-8:                        b'\xc3\xa1' \(2 bytes\)
    In binary:                    1100 0011  1010 0001
    Decomposition info:           á = \(U+0061 \(LATIN SMALL LETTER A\) + U+0301 \(COMBINING ACUTE ACCENT\)\)

    % char
    Char: 😀
    ---
    Unicode code point \(decimal\): 128512
    Unicode code point \(hex\):     U+1F600
    In binary:                    0000 0001 1111 0110 0000 0000
    Unicode name:                 GRINNING FACE
    Category:                     So \(Other Symbol\)
    Uppercase:                    😀
    Lowercase:                    😀
    UTF-8:                        b'\xf0\x9f\x98\x80' \(4 bytes\)
    In binary:                    1111 0000  1001 1111  1001 1000  1000 0000
    Decomposition info:           None
end

false && begin  # note
Everything you wanted to know about a character :\)

If some info is missing, let me know.
end


function char -d "Detailed information about a character"
	$HOME/.config/fish/myscripts/char.py $argv
end
