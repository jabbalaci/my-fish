# My Fish

This repo. contains my configuration files for
the [Fish 🐟 shell](https://fishshell.com/).

Location of this folder: `~/.config/fish`

## Screenshot

<p align="center">
  <img width="100%" src="https://i.imgur.com/7U8EtJ0.png">
</p>

I use a light theme, BTW.

## Filters

I've made lots of useful filters that you can
find in the `functions/` folder.

A filter takes the output of a program and transforms
it. It is used after a pipe. Example:

```shell
$ echo "hello" | upper
HELLO
```

Most of my filters are implemented in the form
of embedded Python scripts.

Here is the list of my filters in alphabetical order (not yet complete):

<!-- START: filters -->

### (1) addprefix: Add prefix to every line

[addprefix.fish](functions/addprefix.fish)

```shell
    $ cat main.py
    x = 1
    y = 2
    $ cat main.py | addprefix "# "
    # x = 1
    # y = 2
```

### (2) addsuffix: Add suffix to every line

[addsuffix.fish](functions/addsuffix.fish)

```shell
    $ cat main.py
    x = 1
    y = 2
    $ cat main.py | addsuffix " # variable"
    x = 1 # variable
    y = 2 # variable
```

### (3) base64decode: Base64 decode

[base64decode.fish](functions/base64decode.fish)

```shell
    $ echo "aGVsbG8=" | base64decode
    hello
    $ echo "aGVsbG8=" | base64decode | base64encode
    aGVsbG8=
```

### (4) base64encode: Base64 encode

[base64encode.fish](functions/base64encode.fish)

```shell
    $ echo "hello" | base64encode
    aGVsbG8=
    $ echo "hello" | base64encode | base64decode
    hello
```

### (5) between: Print lines between `<start_line>` and `<end_line>` [incl.]

[between.fish](functions/between.fish)

```shell
    $ cat 123.txt
    one
    two
    three
    $ cat 123.txt | between 2 3
    two
    three
```

### (6) bin: Decimal number to binary

[bin.fish](functions/bin.fish)

```shell
    $ echo 2025 | bin
    0b11111101001
    $ echo 2025 | bin | unbin
    2025
```

### (7) border: Draw border around text

[border.fish](functions/border.fish)

```shell
    $ echo "Section 1" | border
    #################
    ##  Section 1  ##
    #################
    $ echo "Section 1" | border '+'
    +++++++++++++++++
    ++  Section 1  ++
    +++++++++++++++++
```

### (8) capitalize: Convert to capitalized text

[capitalize.fish](functions/capitalize.fish)

```shell
    $ echo "hEllO" | capitalize
    Hello
```

### (9) collapse: Collapse multiple whitespaces into single space

[collapse.fish](functions/collapse.fish)

```shell
    $ echo "    .aa    bb.    " | collapse
    .aa bb.
    $ echo "    .aa    bb.    " | collapse | len
    7
```

### (10) ex.title: Extract HTML title from a webpage

[ex.title.fish](functions/ex.title.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.title
    fish shell
```

It was extracted from `<title>fish shell</title>`.

### (11) ex.urls: Extract all URLs

[ex.urls.fish](functions/ex.urls.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.urls
    https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js
    https://oss.maxcdn.com/respond/1.4.2/respond.min.js
    ...
```

### (12) filesize: Convert filesize [bytes] to human-readable format

[filesize.fish](functions/filesize.fish)

```shell
    $ echo 123456 | filesize
    120.56 KB
```

### (13) freq: Word frequency [simple, case-insensitive]

[freq.fish](functions/freq.fish)

```shell
    $ cat words.txt
    aa bb aa aa cc cc dd
    $ cat words.txt | freq
    aa: 3
    cc: 2
    bb: 1
    dd: 1
```

### (14) hex: Decimal number to hex

[hex.fish](functions/hex.fish)

```shell
    $ echo 2025 | hex
    0x7e9
    $ echo 2025 | hex | unhex
    2025
```

### (15) hexview: Show hex values of the input

[hexview.fish](functions/hexview.fish)

```shell
    $ echo "hello" | hexview
    68 65 6C 6C 6F 0A
    $ echo -n "hello" | hexview
    68 65 6C 6C 6F
    # echo -n: no newline character
```

### (16) justify: Fully justify text to `<width>` [default: 78]

[justify.fish](functions/justify.fish)

```shell
    $ cat lorem.txt
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
    molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
    numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
    optio, eaque rerum!
    $ cat lorem.txt | justify
    Lorem  ipsum  dolor  sit  amet  consectetur adipisicing elit. Maxime mollitia,
    molestiae  quas  vel  sint commodi repudiandae consequuntur voluptatum laborum
    numquam  blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
    optio, eaque rerum!
    $ cat lorem.txt | justify 50
    Lorem ipsum dolor sit amet consectetur adipisicing
    elit.  Maxime  mollitia,  molestiae  quas vel sint
    commodi    repudiandae   consequuntur   voluptatum
    laborum numquam blanditiis harum quisquam eius sed
    odit  fugiat  iusto  fuga praesentium optio, eaque
    rerum!
```

### (17) len: Length of a string

[len.fish](functions/len.fish)

```shell
    $ echo "hello" | len
    5
```

### (18) longest: Length of the longest line

[longest.fish](functions/longest.fish)

```shell
    $ cat main.c | longest
    22
```

### (19) lower: Convert to lowercase

[lower.fish](functions/lower.fish)

```shell
    $ echo "hEllO" | lower
    hello
    $ echo "hEllO" | lower | upper
    HELLO
```

### (20) noaccents: Remove accents [á -> a, etc.]

[noaccents.fish](functions/noaccents.fish)

```shell
    $ echo "László" | noaccents
    Laszlo
```

### (21) nonempty: Remove empty lines

[nonempty.fish](functions/nonempty.fish)

```shell
    $ cat main.c
    #include <stdio.h>

    int main()
    {
        printf("hello\n");

        return 0;
    }
    $ cat main.c | nonempty
    #include <stdio.h>
    int main()
    {
        printf("hello\n");
        return 0;
    }
```

### (22) oct: Decimal number to octal

[oct.fish](functions/oct.fish)

```shell
    $ echo 2025 | oct
    0o3751
    $ echo 2025 | oct | unoct
    2025
```

### (23) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

[p.allext.fish](functions/p.allext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

### (24) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

[p.ext.fish](functions/p.ext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

### (25) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

[p.fname.fish](functions/p.fname.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

### (26) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

[p.name.fish](functions/p.name.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

### (27) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

[p.parent.fish](functions/p.parent.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

### (28) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

[p.stem.fish](functions/p.stem.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

### (29) prettyjson: Pretty-print JSON

[prettyjson.fish](functions/prettyjson.fish)

```shell
    $ cat example.json
    { "title": "Hackers", "year": 1995 }
    $ cat example.json | prettyjson
    # the output is shown with `bat`
    $ cat example.json | prettyjson cat
    {
        "title": "Hackers",
        "year": 1995
    }
    # the output is shown with `cat`
```

By default it wants to use the command `bat` (make sure that it's installed).
If you don't have `bat`, you can also use `cat`.
Here is a [screenshot](https://i.imgur.com/W93WyiO.png) of the difference.

### (30) prettynum: Prettify a number

[prettynum.fish](functions/prettynum.fish)

```shell
    $ echo 12345679 | prettynum
    12,345,679
    $ echo 12345679 | prettynum '_'
    12_345_679
```

### (31) qrcode: Generate a QR code from text [ANSI]

[qrcode.fish](functions/qrcode.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is shown in the terminal (see [screenshot](https://i.imgur.com/WaWTdmG.png)).

### (32) qrcode2: Generate a QR code from text [PNG]

[qrcode2.fish](functions/qrcode2.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode2
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is saved as a PNG and opened automatically with the default image viewer
(see [screenshot](https://i.imgur.com/DrFVW2i.png)).

### (33) quote: Create GET-style quoted text

[quote.fish](functions/quote.fish)

```shell
    $ echo "largest prime below 1 million" | quote
    largest+prime+below+1+million
    $ echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
```

### (34) randomline: Select a non-empty random line from input

[randomline.fish](functions/randomline.fish)

```shell
    $ cat 123.txt
    one
    two
    three
    $ cat 123.txt | randomline
    two
    $ cat 123.txt | randomline
    one
```

### (35) removeprefix: Remove prefix

[removeprefix.fish](functions/removeprefix.fish)

```shell
    $ cat main.py
    # x = 1
    # y = 2
    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

### (36) removesuffix: Remove suffix

[removesuffix.fish](functions/removesuffix.fish)

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable
    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

### (37) repeat: Repeat a text `<n>` times

[repeat.fish](functions/repeat.fish)

```shell
    $ echo "*" | repeat 5
    *****
```

### (38) replace: Replace `<old>` with `<new>`

[replace.fish](functions/replace.fish)

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

### (39) reverse: Reverse a string

[reverse.fish](functions/reverse.fish)

```shell
    $ echo "hello" | reverse
    olleh
    $ echo "hello" | reverse | reverse
    hello
```

### (40) sparkline: Generate sparkline chart from numbers

[sparkline.fish](functions/sparkline.fish)

```shell
    $ echo "15 8 23 17 42 8 35 27" | sparkline
    ▂▁▅▃█▁▇▆
```

### (41) title: Convert to title case

[title.fish](functions/title.fish)

```shell
    $ echo "hello world" | title
    Hello World
```

### (42) trim: Trim leading/trailing whitespace

[trim.fish](functions/trim.fish)

```shell
    $ echo "     aa bb    " | trim
    aa bb
    $ echo "     aa bb    " | trim | len
    5
```

### (43) unbin: Binary number to decimal

[unbin.fish](functions/unbin.fish)

```shell
    $ echo 1110 | unbin
    14
    $ echo 1110 | unbin | bin
    0b1110
```

### (44) unhex: Hex number to decimal

[unhex.fish](functions/unhex.fish)

```shell
    $ echo ff | unhex
    255
    $ echo ff | unhex | hex
    0xff
```

### (45) unoct: Octal number to decimal

[unoct.fish](functions/unoct.fish)

```shell
    $ echo 755 | unoct
    493
    $ echo 755 | unoct | oct
    0o755
```

### (46) unquote: Decode GET-style quoted text

[unquote.fish](functions/unquote.fish)

```shell
    $ echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million
    $ echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
```

### (47) upper: Convert to uppercase

[upper.fish](functions/upper.fish)

```shell
    $ echo "hEllO" | upper
    HELLO
    $ echo "hEllO" | upper | lower
    hello
```

### (48) urldecode: URL-decode input

[urldecode.fish](functions/urldecode.fish)

```shell
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
```

### (49) urlencode: URL-encode input

[urlencode.fish](functions/urlencode.fish)

```shell
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
```

### (50) wolfram: Ask Wolfram Alpha

[wolfram.fish](functions/wolfram.fish)

```shell
    $ echo "largest prime below 1 million" | wolfram
    999983
    $ echo "Is 31 a prime?" | wolfram
    yes
```

You need an API key for this (it's free).
API docs: https://products.wolframalpha.com/short-answers-api/documentation

<!-- END: filters -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
