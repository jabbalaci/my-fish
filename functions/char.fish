false && begin  # example
    % char -h
    -h, --help      This help
    --dec 65        Unicode code point as decimal number \(here: 'A'\)
    --hex 41        Unicode code point as hex. number \(here: 0x41 = 65, which is 'A'\)
    --char á        Provide the character \(here: 'á'\)

    % char
    Char: á
    ===
    ## Basic Information
    Character:                    'á'
    Unicode code point \(dec\):     225
    Unicode code point \(hex\):     U+00E1
    In binary:                    1110 0001
    Unicode name:                 LATIN SMALL LETTER A WITH ACUTE
    Category:                     Ll \(Lowercase Letter\)

    ## Case & Transformation
    Uppercase:                    'Á' \(U+00C1\)
    Lowercase:                    'á' \(U+00E1\)

    ## Encoding Information
    UTF-8:                        b'\xc3\xa1' \(2 bytes\)
    UTF-8 binary:                 1100 0011  1010 0001
    URL encode:                   %C3%A1

    ## Normalization Forms
    Decomposition info \(NFD\):     'á' = \(U+0061 \(LATIN SMALL LETTER A\) + U+0301 \(COMBINING ACUTE ACCENT\)\)

    ## Web & Markup
    HTML entity:                  &aacute;
    HTML numeric:                 &#225; or &#x00E1;
    JSON escape:                  \u00e1

    % char
    Char: helló
    ===
    Error: provide a single character
    It contains 5 characters.
    NFKC decomposition: helló \(U+0068 0065 006C 006C 00F3\)
end

false && begin  # note
Everything you wanted to know about a character :\)

If some info is missing, let me know.
end


function char -d "Detailed information about a character"
	$HOME/.config/fish/myscripts/char.py $argv
end
