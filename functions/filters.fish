function filters -d "My filters"
    echo "My filters" | border
    echo -n "\
upper, lower, capitalize, title     - uppercase, lowercase, capitalize, title case
noaccents, nonempty                 - remove accents (á -> a, etc.), remove empty lines
collapse                            - collapse multiple whitespaces into single space
addprefix, addsuffix                - add <prefix> / <suffix> to each line
removeprefix, removesuffix          - remove <prefix> / <suffix> from each line
len, length; reverse                - length of a string; reverse a string
trim, strip                         - trim leading/trailing whitespace
replace                             - replace <old> <new>
repeat                              - repeat a text <n> times
# /usr/lib/python2.5/stuff.tar.gz
p.parent, p.dir                     -> /usr/lib/python2.5
p.name                              -> stuff.tar.gz
p.fname                             -> stuff   (just the filename)
p.ext                               -> .gz     (last extension)
p.allext                            -> .tar.gz (all extensions)
p.stem                              -> stuff.tar
ex.urls, ex.title                   - extract: URLs from a webpage, HTML title of a webpage
base64encode, base64decode          - base64 encode/decode
(un)hex, (un)bin, (un)oct           - decimal <-> hex, decimal <-> binary, decimal <-> octal
(un)roman                           - number <-> Roman numeral
urlencode, urldecode                - URL encode/decode
(un)quote                           - create/decode GET-style quoted text
prettyjson, prettynum               - prettify JSON, prettify number
longest                             - length of the longest line
justify                             - fully justify text to <width> (default: 78)
filesize                            - filesize (bytes) to human-readable format
qrcode, qrcode2                     - generate QR code from text (ANSI, PNG)
border                              - draw border around text
wolf, wolfram                       - ask Wolfram Alpha
hexview                             - show hex values of the input
randomline                          - select a non-empty random line
between                             - print lines between <start_line> and <end_line> (incl.)
sparkline                           - generate sparkline chart from numbers
=== Fun ===
typewriter(2)                       - print text with some delay (without and with sound)
rot13, caesar                       - ROT13 cipher, Caesar cipher with <rot>
randomcase; swapcase; mixup         - alternate case randomly; swap cases; mix up inner letters of each word, keeping first/last intact
(un)morse                           - text <-> Morse code
zalgo(0), (un)flip, (un)mirror      - add Zalgo characters, (un)flip text upside down, (un)mirror text vertically
(un)tiny                            - text <-> tiny superscript letters
shuffle                             - shuffle characters in each line
obfuscate                           - replace letters with similar-looking symbols [e -> 3, a -> @, etc.]
"
end
