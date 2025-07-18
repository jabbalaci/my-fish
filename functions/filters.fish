false && begin  # example
    % filters
    # prints my filters
end

false && begin  # note
It just prints a list of my filters.
The filters are organized into categories.
I must update this list manually.
end


function filters -d "My filters"
    echo "My filters" | border
    echo -n "\
>>> Python-like <<<
upper, lower, capitalize, title     - uppercase, lowercase, capitalize, title case
len, length; reverse                - length of a string; reverse a string
trim, strip                         - trim leading/trailing whitespace
collapse                            - collapse multiple whitespaces into single space (like split)
words                               - print each word of the input
replace                             - replace <old> <new>
repeat                              - repeat a text <n> times
addprefix, addsuffix                - add <prefix> / <suffix> to each line
removeprefix, removesuffix          - remove <prefix> / <suffix> from each line
(un)hex, (un)bin, (un)oct           - decimal <-> hex, decimal <-> binary, decimal <-> octal
quotes                              - add quotes around the input
# /usr/lib/python2.5/stuff.tar.gz
p.parent, p.dir                     -> /usr/lib/python2.5
p.name                              -> stuff.tar.gz
p.fname                             -> stuff   (just the filename)
p.ext                               -> .gz     (last extension)
p.allext                            -> .tar.gz (all extensions)
p.stem                              -> stuff.tar

>>> Web/Net <<<
ex.urls, ex.title                   - extract: URLs from a webpage, HTML title of a webpage
ex.thumbnail                        - extract the URL of a YouTube video's thumbnail
urlencode, urldecode                - URL encode/decode
(un)quote                           - create/decode GET-style quoted text
wolfram, wolf                       - ask Wolfram Alpha

>>> Utils/Mixed <<<
noaccents, nonempty                 - remove accents (á -> a, etc.), remove empty lines
whitespaces                         - show whitespaces
base64encode, base64decode          - base64 encode/decode
(un)utf8                            - encode to UTF-8, decode from UTF-8
prettyjson, prettynum               - prettify JSON, prettify number
longest                             - length of the longest line
justify                             - fully justify text to <width> (default: 78)
filesize                            - filesize (bytes) to human-readable format
qrcode, qrcode2                     - generate QR code from text (ANSI, PNG)
border                              - draw border around text
hexview, hexview2                   - show hex values of the input
randomline                          - select a non-empty random line
between                             - print lines between <start_line> and <end_line> (incl.)
between.re                          - print lines between <start_regex> and <end_regex> (incl.)
sparkline                           - generate sparkline chart from numbers
freq                                - word frequency (simple, case-insensitive)
dedup, dups                         - remove duplicates and keep order, show duplicates
take, skip                          - take/skip the first <n> lines, or take/skip the last line if `last` is provided
every                               - take every <n>th line, optionally starting from <from>
min, max, sum, avg, prod            - smallest element, largest element, sum, average, product

>>> Fun <<<
typewriter(2)                       - print text with some delay (without and with sound)
rot                                 - rotate letters with <n> positions (Caesar-coding)
randomcase; swapcase; mixup         - alternate case randomly; swap cases; mix up inner letters of each word, keeping first/last intact
shuffle                             - shuffle characters in each line
obfuscate                           - replace letters with similar-looking symbols [e -> 3, a -> @, etc.]
(un)roman                           - number <-> Roman numeral
(un)morse                           - text <-> Morse code
zalgo{1..3}, (un)flip, (un)mirror   - add Zalgo characters, (un)flip text upside down, (un)mirror text vertically
(un)tiny                            - text <-> tiny superscript letters
"
end
