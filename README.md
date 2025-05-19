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

### (3) bin: Decimal number to binary

[bin.fish](functions/bin.fish)

```shell
    $ echo 2025 | bin
    0b11111101001
    $ echo 2025 | bin | unbin
    2025
```

### (4) capitalize: Convert to capitalized text

[capitalize.fish](functions/capitalize.fish)

```shell
    $ echo "hEllO" | capitalize
    Hello
```

### (5) collapse: Collapse multiple whitespaces into single space

[collapse.fish](functions/collapse.fish)

```shell
    $ echo "    .aa    bb.    " | collapse
    .aa bb.
    $ echo "    .aa    bb.    " | collapse | len
    7
```

### (6) ex.title: Extract HTML title from a webpage

[ex.title.fish](functions/ex.title.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.title
    fish shell
```

It was extracted from `<title>fish shell</title>`.

### (7) ex.urls: Extract all URLs

[ex.urls.fish](functions/ex.urls.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.urls
    https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js
    https://oss.maxcdn.com/respond/1.4.2/respond.min.js
    ...
```

### (8) hex: Decimal number to hex

[hex.fish](functions/hex.fish)

```shell
    $ echo 2025 | hex
    0x7e9
    $ echo 2025 | hex | unhex
    2025
```

### (9) len: Length of a string

[len.fish](functions/len.fish)

```shell
    $ echo "hello" | len
    5
```

### (10) lower: Convert to lowercase

[lower.fish](functions/lower.fish)

```shell
    $ echo "hEllO" | lower
    hello
    $ echo "hEllO" | lower | upper
    HELLO
```

### (11) oct: Decimal number to octal

[oct.fish](functions/oct.fish)

```shell
    $ echo 2025 | oct
    0o3751
    $ echo 2025 | oct | unoct
    2025
```

### (12) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

[p.allext.fish](functions/p.allext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

### (13) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

[p.ext.fish](functions/p.ext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

### (14) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

[p.fname.fish](functions/p.fname.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

### (15) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

[p.name.fish](functions/p.name.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

### (16) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

[p.parent.fish](functions/p.parent.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

### (17) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

[p.stem.fish](functions/p.stem.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

### (18) quote: Create GET-style quoted text

[quote.fish](functions/quote.fish)

```shell
    $ echo "largest prime below 1 million" | quote
    largest+prime+below+1+million
    $ echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
```

### (19) removeprefix: Remove prefix

[removeprefix.fish](functions/removeprefix.fish)

```shell
    $ cat main.py
    # x = 1
    # y = 2
    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

### (20) removesuffix: Remove suffix

[removesuffix.fish](functions/removesuffix.fish)

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable
    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

### (21) repeat: Repeat a text `<n>` times

[repeat.fish](functions/repeat.fish)

```shell
    $ echo "*" | repeat 5
    *****
```

### (22) replace: Replace `<old>` with `<new>`

[replace.fish](functions/replace.fish)

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

### (23) reverse: Reverse a string

[reverse.fish](functions/reverse.fish)

```shell
    $ echo "hello" | reverse
    olleh
    $ echo "hello" | reverse | reverse
    hello
```

### (24) title: Convert to title case

[title.fish](functions/title.fish)

```shell
    $ echo "hello world" | title
    Hello World
```

### (25) trim: Trim leading/trailing whitespace

[trim.fish](functions/trim.fish)

```shell
    $ echo "     aa bb    " | trim
    aa bb
    $ echo "     aa bb    " | trim | len
    5
```

### (26) unbin: Binary number to decimal

[unbin.fish](functions/unbin.fish)

```shell
    $ echo 1110 | unbin
    14
    $ echo 1110 | unbin | bin
    0b1110
```

### (27) unhex: Hex number to decimal

[unhex.fish](functions/unhex.fish)

```shell
    $ echo ff | unhex
    255
    $ echo ff | unhex | hex
    0xff
```

### (28) unoct: Octal number to decimal

[unoct.fish](functions/unoct.fish)

```shell
    $ echo 755 | unoct
    493
    $ echo 755 | unoct | oct
    0o755
```

### (29) unquote: Decode GET-style quoted text

[unquote.fish](functions/unquote.fish)

```shell
    $ echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million
    $ echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
```

### (30) upper: Convert to uppercase

[upper.fish](functions/upper.fish)

```shell
    $ echo "hEllO" | upper
    HELLO
    $ echo "hEllO" | upper | lower
    hello
```

### (31) urldecode: URL-decode input

[urldecode.fish](functions/urldecode.fish)

```shell
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
```

### (32) urlencode: URL-encode input

[urlencode.fish](functions/urlencode.fish)

```shell
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
```

### (33) wolfram: Ask Wolfram Alpha

[wolfram.fish](functions/wolfram.fish)

```shell
    $ echo "largest prime below 1 million" | wolfram
    999983
    $ echo "Is 31 a prime?" | wolfram
    yes
```

You need an API key for this (it's free).
API docs: https://products.wolframalpha.com/short-answers-api/documentation .

<!-- END: filters -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
