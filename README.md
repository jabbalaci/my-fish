# My Fish

This repo. contains my configuration files for
the [Fish 🐟 shell](https://fishshell.com/).

Location of this folder: `~/.config/fish`

## Table of Contents

1. [Screenshot](#screenshot)
1. [Filters](#filters)
1. [Functions](#functions)
3. [Issues](#issues)
4. [Links](#links)
5. [Author](#author)

## Screenshot

<p align="center">
  <img width="100%" src="https://i.imgur.com/7U8EtJ0.png">
</p>

I use a light theme, BTW.

## Filters

I've made lots of useful filters that you can
find in the [`functions/`](functions/) folder.

A filter takes the output of a program as its input and transforms it.
It is used after a pipe. Example:

```shell
$ echo "hello" | upper
HELLO
```

Most of my filters are implemented in the form
of embedded Python scripts.

Let me put here a note: by default, CPython starts
slowly. Normally it's not an issue, but when
you chain several filters together, these times
add up. On my machine, executing an empty file
took 90 ms. It was the startup time of the interpreter.
The more filters I chained, the slower it became.
But I found a trick: with the `-S` option (ex.: `python3 -S script.py`) we can
disable the import of the `site` module, thus
I could reduce the startup time from 90 ms to 10 ms.
Since I don't use any 3rd-party libraries in my filters,
just the standard library, it shouldn't cause any
problems. However, if you encounter any problem,
just let me know. Thanks.

On Reddit, from `/u/_mattmc3_` I got some great tips
how to rewrite some of these functions in an
idiomatic way.

Here is the list of my filters in alphabetical order:

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

### (3) avg: Calculate the average

[avg.fish](functions/avg.fish)

```shell
    $ cat file.txt
    169.69
    230.35
    211.62
    269.94
    209.64
    492.34
    425.83

    $ cat file.txt | avg
    287.06
```

### (4) base64decode: Base64 decode

[base64decode.fish](functions/base64decode.fish)

```shell
    $ echo "aGVsbG8=" | base64decode
    hello

    $ echo "aGVsbG8=" | base64decode | base64encode
    aGVsbG8=
```

### (5) base64encode: Base64 encode

[base64encode.fish](functions/base64encode.fish)

```shell
    $ echo "hello" | base64encode
    aGVsbG8=

    $ echo "hello" | base64encode | base64decode
    hello
```

### (6) between: Print lines between `<start_line>` and `<end_line>` [incl.]

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

### (7) between.re: Print lines between two regex matches [inclusive]

[between.re.fish](functions/between.re.fish)

```shell
    $ cat file.txt
    aaa
    ONE
    bbb
    ccc
    TWO
    ddd

    $ cat file.txt | between.re ONE TWO
    ONE
    bbb
    ccc
    TWO

    $ cat file.txt | between.re ONE TWO | skip 1 | skip last
    bbb
    ccc
```

There's a similar filter called `between`, which requires two line numbers
and prints all the lines between these two values (incl.).

Here you need to specify two regular expressions instead of two line numbers.

It reads the whole input, thus don't use it with huge files.

### (8) bin: Decimal number to binary

[bin.fish](functions/bin.fish)

```shell
    $ echo 2025 | bin
    0b11111101001

    $ echo 2025 | bin | unbin
    2025
```

### (9) border: Draw border around text

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

### (10) capitalize: Convert to capitalized text

[capitalize.fish](functions/capitalize.fish)

```shell
    $ echo "hEllO" | capitalize
    Hello
```

### (11) collapse: Collapse multiple whitespaces into single space

[collapse.fish](functions/collapse.fish)

```shell
    $ echo "    .aa    bb.    " | quotes
    '    .aa    bb.    '

    $ echo "    .aa    bb.    " | collapse
    .aa bb.

    $ echo "    .aa    bb.    " | collapse | quotes
    '.aa bb.'
```

### (12) dedup: Remove duplicate lines and keep the original order

[dedup.fish](functions/dedup.fish)

```shell
    $ cat file.txt
    dd
    bb
    dd  # duplicate
    aa
    aa  # duplicate
    bb  # duplicate

    $ cat file.txt | dedup
    dd
    bb
    aa
```

In the first example, `duplicate` is just a note, not part of the file.

### (13) dups: Find duplicate lines

[dups.fish](functions/dups.fish)

```shell
    $ cat file.txt
    dd
    bb
    dd  # duplicate
    aa
    aa  # duplicate
    aa  # duplicate

    $ cat file.txt | dups
    dd
    aa
    aa

    $ cat file.txt | dups | dedup
    dd
    aa
```

In the first example, `duplicate` is just a note, not part of the file.

`dups` will print all the duplicates, even several times.
If you want to see a duplicate just once, then combine it with the `dedup` filter.

### (14) every: Take every <n>th line, optionally starting from <from>

[every.fish](functions/every.fish)

```shell
    $ cat file.txt
    1
    one
    2
    two
    3
    three

    # take every second line
    $ cat file.txt | every 2
    one
    two
    three

    # take every second line from the first line
    $ cat file.txt | every 2 --from 1
    1
    2
    3

    # take every second line from the fourth line
    $ cat file.txt | every 2 --from 4
    two
    three
```

The index of the 1st line is 1.

### (15) ex.thumbnail: Extract the URL of a YouTube video's thumbnail

[ex.thumbnail.fish](functions/ex.thumbnail.fish)

```shell
    $ echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg

    $ echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail open
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg
    # and it also opens the thumbnail with the default image viewer
```

It extracts the URL of the thumbnail of a YouTube video.

### (16) ex.title: Extract HTML title from a webpage

[ex.title.fish](functions/ex.title.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.title
    fish shell
```

It was extracted from `<title>fish shell</title>`.

### (17) ex.urls: Extract all URLs

[ex.urls.fish](functions/ex.urls.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.urls
    https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js
    https://oss.maxcdn.com/respond/1.4.2/respond.min.js
    ...
```

### (18) filesize: Convert filesize [bytes] to human-readable format

[filesize.fish](functions/filesize.fish)

```shell
    $ echo 123456 | filesize
    120.56 KB
```

### (19) flip: Flip input text upside down using Unicode

[flip.fish](functions/flip.fish)

```shell
    $ echo "Fish shell" | flip
    ʃʃǝɥs ɥsᴉℲ

    $ echo "Fish shell" | flip | unflip
    Fish shell
```

### (20) freq: Word frequency [simple, case-insensitive]

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

### (21) getcol: Split the input on whitespace and print the column indicated

[getcol.fish](functions/getcol.fish)

```shell
    $ echo 1 2 | getcol 2
    2
```

**get** the given **col**umn

### (22) getrow: Print the row of the input indicated

[getrow.fish](functions/getrow.fish)

```shell
    $ seq 3
    1
    2
    3

    $ seq 3 | getrow 2
    2
```

**get** the given **row**

### (23) hex: Decimal number to hex

[hex.fish](functions/hex.fish)

```shell
    $ echo 2025 | hex
    0x7e9

    $ echo 2025 | hex | unhex
    2025
```

### (24) hexview: Show hex values of the input

[hexview.fish](functions/hexview.fish)

```shell
    $ echo "Éva" | hexview
    ÉC9 v76 a61 ␤0A

    $ echo -n "Éva" | hexview
    ÉC9 v76 a61
    # echo -n: no newline character

    $ echo "Éva" | hexview bin
    .C3 .89 v76 a61 ␤0A
```

This filter is **made for text input** that may contain non-ASCII characters.
For binary files, use a proper hex editor.

You can use it 2 modes:

* text mode (default)
* binary mode

Tab, newline, carriage return and space characters are made visible with Unicode characters.

In text mode, in front of a hex value it also shows the character for easier identification.
If you have non-ASCII characters in your input, you'd better switch to binary mode.
In binary mode, the input is processed as a byte stream. Non-printable characters appear as a dot (`.`).

### (25) hexview2: Show the input and the hex values of the input side-by-side

[hexview2.fish](functions/hexview2.fish)

```shell
    $ cat main.c | hexview2
    # opens an editor in split mode
    # left side: content of the file
    # right side: hex values of the lines

    $ cat main.c | hexview2 bin
    # bin mode is also available for hexview2
```

This filter is **made for text input** that may contain non-ASCII characters.
For binary files, use a proper hex editor.

You can see the input and the hex values side-by-side.
The hex values are generated with the `hexview` filter.

### (26) joinlines: Join the input lines with a separator

[joinlines.fish](functions/joinlines.fish)

```shell
    $ cat text.txt
    aaa
    bbb
    ccc

    $ cat text.txt | joinlines
    aaabbbccc

    $ cat text.txt | joinlines ", "
    aaa, bbb, ccc
```

### (27) justify: Fully justify text to `<width>` [default: 78]

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

### (28) len: Length of a string

[len.fish](functions/len.fish)

```shell
    $ echo "hello" | len
    5
```

### (29) longest: Length of the longest line

[longest.fish](functions/longest.fish)

```shell
    $ cat main.c | longest
    22
```

### (30) lower: Convert to lowercase

[lower.fish](functions/lower.fish)

```shell
    $ echo "hEllO" | lower
    hello

    $ echo "hEllO" | lower | upper
    HELLO
```

### (31) max: Find the largest element [default type: int]

[max.fish](functions/max.fish)

```shell
    $ cat file.txt
    1
    3
    2

    $ cat file.txt | max
    3

    $ cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    $ cat numbers.txt | max --float
    492.34
```

We suppose that there's one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default), `--float` and `--str`.

### (32) min: Find the smallest element [default type: int]

[min.fish](functions/min.fish)

```shell
    $ cat file.txt
    3
    1
    2

    $ cat file.txt | min
    1

    $ cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    $ cat numbers.txt | min --float
    169.69
```

We suppose that there's one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default), `--float` and `--str`.

### (33) mirror: Mirror text using mirrored Unicode characters

[mirror.fish](functions/mirror.fish)

```shell
    $ echo "Fish shell" | mirror
    llɘʜƨ ʜƨiᖷ

    $ echo "Fish shell" | mirror | unmirror
    Fish shell
```

It might be improved with https://www.flipyourtext.com/

### (34) mixup: Mix up inner letters of each word, keeping first/last intact

[mixup.fish](functions/mixup.fish)

```shell
    $ echo "This is just a sentence." | mixup
    Tihs is just a snetcnee.

    $ cat fish.txt | mixup
    Fish (feldirny iarncitetve shlel; syeilztd in lcworasee) is a Uinx-like slhel wtih a foucs
    on icintiettravy and utilaisby. Fish is dngeised to be fatreue-rich by dfaulet,
    reathr tahn highly clfrguoaibne, and does not ardehe to PISOX shlel sdartdans by desgin.
```

Interestingly, if you mix up the inner letters of words, but you keep the first
and last letters intact, the text is still rather readable.

The readable version of the 2nd example is [here](https://en.wikipedia.org/wiki/Fish_%28Unix_shell%29).

### (35) morse: Convert text to Morse code [e.g., 'SOS' -> '... --- ...']

[morse.fish](functions/morse.fish)

```shell
    $ echo "SOS Titanic" | morse
    ... --- ... / - .. - .- -. .. -.-.

    $ echo "SOS Titanic" | morse | unmorse
    SOS TITANIC
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (36) noaccents: Remove accents [á -> a, etc.]

[noaccents.fish](functions/noaccents.fish)

```shell
    $ echo "László" | noaccents
    Laszlo
```

### (37) nonempty: Remove empty lines

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

### (38) obfuscate: Replace letters with similar-looking symbols [e -> 3, a -> @, etc.]

[obfuscate.fish](functions/obfuscate.fish)

```shell
    $ echo "This is just a sentence." | obfuscate
    7h1$ 1$ ju$7 @ $3n73nc3.
```

### (39) oct: Decimal number to octal

[oct.fish](functions/oct.fish)

```shell
    $ echo 2025 | oct
    0o3751

    $ echo 2025 | oct | unoct
    2025
```

### (40) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

[p.allext.fish](functions/p.allext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

### (41) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

[p.ext.fish](functions/p.ext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

### (42) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

[p.fname.fish](functions/p.fname.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

### (43) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

[p.name.fish](functions/p.name.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

### (44) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

[p.parent.fish](functions/p.parent.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

### (45) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

[p.stem.fish](functions/p.stem.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

### (46) prettyjson: Pretty-print JSON

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

### (47) prettynum: Prettify a number

[prettynum.fish](functions/prettynum.fish)

```shell
    $ echo 12345679 | prettynum
    12,345,679

    $ echo 12345679 | prettynum '_'
    12_345_679
```

### (48) prod: Product of the values in the input

[prod.fish](functions/prod.fish)

```shell
    $ cat file.txt
    3
    5
    2

    $ cat file.txt | prod
    30

    $ cat numbers.txt
    230.35
    211.62
    269.94

    $ cat numbers.txt | prod --float
    13158675.28998
```

We suppose that there's one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default) and `--float`.

### (49) qrcode: Generate a QR code from text [ANSI]

[qrcode.fish](functions/qrcode.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is shown in the terminal (see [screenshot](https://i.imgur.com/WaWTdmG.png)).

### (50) qrcode2: Generate a QR code from text [PNG]

[qrcode2.fish](functions/qrcode2.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode2
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is saved as a PNG and opened automatically with the default image viewer
(see [screenshot](https://i.imgur.com/DrFVW2i.png)).

### (51) quote: Create GET-style quoted text

[quote.fish](functions/quote.fish)

```shell
    $ echo "largest prime below 1 million" | quote
    largest+prime+below+1+million

    $ echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
```

### (52) quotes: Add quotes around the input

[quotes.fish](functions/quotes.fish)

```shell
    $ echo "hello"
    hello

    $ echo "hello" | quotes
    'hello'
```

Puts the input among quotes, making the beginning and the end of the input clearly visible.

### (53) randomcase: Alternate case randomly

[randomcase.fish](functions/randomcase.fish)

```shell
    $ echo "Hello World" | randomcase
    heLLo woRLd

    $ echo "Hello World" | randomcase
    HEllo WorLD
```

### (54) randomline: Select a non-empty random line from input

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

### (55) removeprefix: Remove prefix

[removeprefix.fish](functions/removeprefix.fish)

```shell
    $ cat main.py
    # x = 1
    # y = 2

    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

### (56) removesuffix: Remove suffix

[removesuffix.fish](functions/removesuffix.fish)

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable

    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

### (57) repeat: Repeat a text `<n>` times

[repeat.fish](functions/repeat.fish)

```shell
    $ echo "*" | repeat 5
    *****
```

### (58) replace: Replace `<old>` with `<new>`

[replace.fish](functions/replace.fish)

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

### (59) reverse: Reverse a string

[reverse.fish](functions/reverse.fish)

```shell
    $ echo "hello" | reverse
    olleh

    $ echo "hello" | reverse | reverse
    hello
```

If you pass it the content of a text file, it reads the whole content of the
file and reverses the whole content.

If you want to reverse a file line-by-line, use the `rev` command from the `util-linux` package:

```shell
    $ cat book.txt | rev
```

### (60) roman: Convert number to Roman numeral [1-3999]

[roman.fish](functions/roman.fish)

```shell
    $ echo 2025 | roman
    MMXXV

    $ echo 2025 | roman | unroman
    2025
```

### (61) rot: Rotate letters with with `<n>` positions

[rot.fish](functions/rot.fish)

```shell
    $ echo "Fish" | rot 2
    Hkuj

    $ echo "Fish" | rot -2
    Dgqf

    $ echo "Fish" | rot 2 | rot -2
    Fish

    $ echo "Fish" | rot 13
    Svfu

    $ echo "Fish" | rot 13 | rot13
    Fish
```

[Caesar's code.](https://en.wikipedia.org/wiki/Caesar_cipher) Letters of the English
alphabet are rotated by `n` positions. `n` can be negative too, in which case letters
are rotated left.

[ROT13](https://en.wikipedia.org/wiki/ROT13) is a special case of the Caesar cipher.

### (62) shuffle: Shuffle characters in each line

[shuffle.fish](functions/shuffle.fish)

```shell
    $ echo "12345678" | shuffle
    14857362

    $ echo "12345678" | shuffle
    12563487
```

### (63) skip: Skip the first `<n>` lines of stdin, or skip the last line if `last` is provided

[skip.fish](functions/skip.fish)

```shell
    $ seq 5
    1
    2
    3
    4
    5

    $ seq 5 | skip 2
    3
    4
    5

    $ seq 5 | skip last
    1
    2
    3
    4
```

Skips the first `n` lines of stdin.

If `last` is provided, then it skips the last line.

### (64) sparkline: Generate sparkline chart from numbers

[sparkline.fish](functions/sparkline.fish)

```shell
    $ echo "15 8 23 17 42 8 35 27" | sparkline
    ▂▁▅▃█▁▇▆
```

### (65) sum: Sum of the values in the input

[sum.fish](functions/sum.fish)

```shell
    $ cat file.txt
    3
    1
    2

    $ cat file.txt | sum
    6

    $ cat numbers.txt
    230.35
    211.62
    269.94
    169.69
    209.64
    492.34
    425.83

    $ cat numbers.txt | sum --float
    2009.41
```

`sum` is an existing program in the `coreutils` package. If you need that,
then give this function a different name.

We suppose that there's one value per line in the input.

You can specify the data type of the input.
Supported data types: `--int` (default) and `--float`.

### (66) swapcase: Swap lower- and uppercase

[swapcase.fish](functions/swapcase.fish)

```shell
    $ echo "Hello World" | swapcase
    hELLO wORLD
```

### (67) take: Take the first `<n>` lines of stdin, or take the last line if `last` is provided

[take.fish](functions/take.fish)

```shell
    $ seq 5
    1
    2
    3
    4
    5

    $ seq 5 | take 3
    1
    2
    3

    $ seq 5 | take last
    5
```

Take the first `n` lines of the standard input.

If `last` is provided, then take the last line.

### (68) tiny: Convert text to tiny superscript letters

[tiny.fish](functions/tiny.fish)

```shell
    $ echo "Fish shell" | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ

    $ echo "Fish shell" | tiny | untiny
    FiSh Shell
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (69) title: Convert to title case

[title.fish](functions/title.fish)

```shell
    $ echo "hello world" | title
    Hello World
```

### (70) trim: Trim leading/trailing whitespace

[trim.fish](functions/trim.fish)

```shell
    $ echo "     aa bb    " | trim
    aa bb

    $ echo "     aa bb    " | trim | len
    5
```

### (71) typewriter: Print like a typewriter

[typewriter.fish](functions/typewriter.fish)

```shell
    $ cat main.c | typewriter
    #include <stdio.h>

    int main...
```

The content of the file is printed character by character,
with some delay, similarly to a typewriter.

### (72) typewriter2: Print like a typewriter with sound effects

[typewriter2.fish](functions/typewriter2.fish)

```shell
    $ cat main.c | typewriter2
    #include <stdio.h>

    int main...
```

The content of the file is printed character by character,
with some delay. This version adds clicky sounds to
each character, making it similar to typing on a keyboard.

The sound files are played with `mplayer` (make sure it's installed).
You can download some sound file packs from here: https://github.com/jabbalaci/keysound/tree/main/sounds .
This one uses the `fallout` sound pack.

### (73) unbin: Binary number to decimal

[unbin.fish](functions/unbin.fish)

```shell
    $ echo 1110 | unbin
    14

    $ echo 1110 | unbin | bin
    0b1110
```

### (74) unflip: Revert upside-down Unicode text back to normal

[unflip.fish](functions/unflip.fish)

```shell
    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip
    Fish shell

    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip | flip
    ʃʃǝɥs ɥsᴉℲ
```

### (75) unhex: Hex number to decimal

[unhex.fish](functions/unhex.fish)

```shell
    $ echo ff | unhex
    255

    $ echo ff | unhex | hex
    0xff
```

### (76) unmirror: Convert mirrored text back to normal

[unmirror.fish](functions/unmirror.fish)

```shell
    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror
    Fish shell

    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror | mirror
    llɘʜƨ ʜƨiᖷ
```

It might be improved with https://www.flipyourtext.com/

### (77) unmorse: Convert Morse code to text [e.g., '... --- ...' -> 'SOS']

[unmorse.fish](functions/unmorse.fish)

```shell
    $ echo "- .. - .- -. .. -.-." | unmorse
    TITANIC

    $ echo "- .. - .- -. .. -.-." | unmorse | morse
    - .. - .- -. .. -.-.
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (78) unoct: Octal number to decimal

[unoct.fish](functions/unoct.fish)

```shell
    $ echo 755 | unoct
    493

    $ echo 755 | unoct | oct
    0o755
```

### (79) unquote: Decode GET-style quoted text

[unquote.fish](functions/unquote.fish)

```shell
    $ echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million

    $ echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
```

### (80) unroman: Convert Roman numeral to number

[unroman.fish](functions/unroman.fish)

```shell
    $ echo MMXXV | unroman
    2025

    $ echo MMXXV | unroman | roman
    MMXXV
```

### (81) untiny: Convert tiny superscript letters back to normal text [not perfect]

[untiny.fish](functions/untiny.fish)

```shell
    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny
    FiSh Shell

    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (82) unutf8: Decode the input with UTF-8

[unutf8.fish](functions/unutf8.fish)

```shell
    $ echo "\xc3\x89\x76\x61" | unutf8
    Éva

    $ echo "\xc3\x89\x76\x61" | unutf8 | utf8
    \xc3\x89\x76\x61\x0a
    # where \x0a is the newline character ('\n')
```

Decode a UTF-8-encoded byte array.

### (83) upper: Convert to uppercase

[upper.fish](functions/upper.fish)

```shell
    $ echo "hEllO" | upper
    HELLO

    $ echo "hEllO" | upper | lower
    hello
```

### (84) urldecode: URL-decode input

[urldecode.fish](functions/urldecode.fish)

```shell
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)

    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
```

### (85) urlencode: URL-encode input

[urlencode.fish](functions/urlencode.fish)

```shell
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29

    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
```

### (86) utf8: Encode the input with UTF-8

[utf8.fish](functions/utf8.fish)

```shell
    $ echo -n "Éva" | utf8
    \xc3\x89\x76\x61

    $ echo -n "Éva" | utf8 | unutf8
    Éva
```

Encode the input to a UTF-8-encoded byte array.

### (87) whitespaces: Show whitespaces

[whitespaces.fish](functions/whitespaces.fish)

```shell
    $ cat Makefile
    cat:
            cat Makefile

    $ cat Makefile | whitespaces
    cat:␤
    ⭾cat␣Makefile␤
```

Tab, newline, carriage return and space characters are made visible with Unicode characters.

### (88) wolfram: Ask Wolfram Alpha

[wolfram.fish](functions/wolfram.fish)

```shell
    $ echo "largest prime below 1 million" | wolfram
    999983

    $ echo "Is 31 a prime?" | wolfram
    yes
```

You need an API key for this (it's free).
API docs: https://products.wolframalpha.com/short-answers-api/documentation

### (89) words: Split input into words

[words.fish](functions/words.fish)

```shell
    $ cat file.txt
    aa      bb     cc
    dd

    $ cat file.txt | words
    aa
    bb
    cc
    dd
```

Each word is printed on a separate line.

### (90) zalgo1: Add funny accents to characters [a -> ấ, etc.]

[zalgo1.fish](functions/zalgo1.fish)

```shell
    $ echo "Fish shell" | zalgo1
    Fǐśħ śĥéŀĺ

    $ echo "Fish shell" | zalgo2
    F̌i̖s̕ȟ ͎sͅhel̬l͜

    $ echo "Fish shell" | zalgo3
    F̪̘҄҃̚i̗̙̖ͨs̱̰ͮ҄҉̚̚h̋̈͐҈̙̗҅ š̖̙ͫ͢h̜̱̘̀҃e͈̠̐҅҉̘l̵̘̃̉҄l͓̘̘
```

It adds glitchy characters to the text.

* zalgo1: light
* zalgo2: medium
* zalgo3: aggressive

### (91) zalgo2: Add random Unicode glitches to text

[zalgo2.fish](functions/zalgo2.fish)

```shell
    $ echo "Fish shell" | zalgo1
    Fǐśħ śĥéŀĺ

    $ echo "Fish shell" | zalgo2
    F̌i̖s̕ȟ ͎sͅhel̬l͜

    $ echo "Fish shell" | zalgo3
    F̪̘҄҃̚i̗̙̖ͨs̱̰ͮ҄҉̚̚h̋̈͐҈̙̗҅ š̖̙ͫ͢h̜̱̘̀҃e͈̠̐҅҉̘l̵̘̃̉҄l͓̘̘
```

It adds glitchy characters to the text.

* zalgo1: light
* zalgo2: medium
* zalgo3: aggressive

### (92) zalgo3: Add Zalgo (glitchy) characters

[zalgo3.fish](functions/zalgo3.fish)

```shell
    $ echo "Fish shell" | zalgo1
    Fǐśħ śĥéŀĺ

    $ echo "Fish shell" | zalgo2
    F̌i̖s̕ȟ ͎sͅhel̬l͜

    $ echo "Fish shell" | zalgo3
    F̪̘҄҃̚i̗̙̖ͨs̱̰ͮ҄҉̚̚h̋̈͐҈̙̗҅ š̖̙ͫ͢h̜̱̘̀҃e͈̠̐҅҉̘l̵̘̃̉҄l͓̘̘
```

It adds glitchy characters to the text.

* zalgo1: light
* zalgo2: medium
* zalgo3: aggressive

<!-- END: filters -->

## Functions

Some of my functions (that are NOT filters) in
alphabetical order:

<!-- START: functions -->

### (1) alphabet: Print the alphabet (lowercase, uppercase, digits, printable characters)

[alphabet.fish](functions/alphabet.fish)

```text
    $ alphabet
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
    !\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
    0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
```

It prints the alphabet (lowercase, uppercase letters), digits and printable characters.

### (2) aur: Find package in the AUR repository

[aur.fish](functions/aur.fish)

```shell
    $ aur edit
    # find the package 'edit' in the AUR repo
```

Find the given package in the AUR repository. It performs an "exact name" search.

### (3) awk-info: Basic usage of the awk command

[awk-info.fish](functions/awk-info.fish)

```shell
    $ awk-info
    # print some info about its basic usage
```

### (4) bak: Create a backup file

[bak.fish](functions/bak.fish)

```shell
    $ ls
    file.txt

    $ bak file.txt

    $ ls
    file.txt
    file.txt.bak
```

Makes a copy of a file with `.bak` extension.

### (5) beep: Play a beep sound

[beep.fish](functions/beep.fish)

```shell
    $ slow_command; beep
    # plays a beep sound
```

Plays a beep sound. Useful to notify you when a slow program finishes.

### (6) binds: Some useful keyboard bindings in Fish

[binds.fish](functions/binds.fish)

```shell
    $ binds
    # list some useful keyboard bindings
```

Just a reminder for me. I tend to forget these goodies.

### (7) bing: Extract the URL of the wallpaper image on bing.com

[bing.fish](functions/bing.fish)

```shell
    $ bing
    https://www.bing.com/th?id=OHR.HoneyBeeLavender_ROW6706348405_tmb.jpg

    $ bing open
    https://www.bing.com/th?id=OHR.HoneyBeeLavender_ROW6706348405_tmb.jpg
    # and it also opens the image with the default image viewer
```

It extracts the URL of the wallpaper photo on bing.com .
Sometimes it doesn't produce any output. Then try again :)

### (8) bm: Bookmark a file (for copy/paste)

[bm.fish](functions/bm.fish)

```shell
    $ pwd
    /tmp/send

    $ bm -c file.txt
    Bookmarked: /tmp/send/file.txt

    $ bm -l
    Bookmarked file: /tmp/send/file.txt

    $ cd
    $ pwd
    /home/jabba

    $ bm -p
    copy: '/tmp/send/file.txt' -> './file.txt'

    $ bm -l
    Bookmarked file: /tmp/send/file.txt

    $ bm -e
    Bookmark cleared.
```

```
Usage:
  bm -c <file>   : Bookmark file
  bm -p          : Paste bookmarked file here
  bm -l          : List bookmarked file
  bm -e          : Erase bookmark
```

You can mark (bookmark) a file. Then, move around
folders and paste the file in a destination folder.
It also works among sessions.

### (9) char: Detailed information about a character

[char.fish](functions/char.fish)

```shell
    $ char -h
    -h, --help      This help
    --dec 65        Unicode code point as decimal number (here: 'A')
    --hex 41        Unicode code point as hex. number (here: 0x41 = 65, which is 'A')
    --char á        Provide the character (here: 'á')

    $ char
    Char: á
    ===
    ## Basic Information
    Character:                    'á'
    Unicode code point (dec):     225
    Unicode code point (hex):     U+00E1
    In binary:                    1110 0001
    Unicode name:                 LATIN SMALL LETTER A WITH ACUTE
    Category:                     Ll (Lowercase Letter)

    ## Case & Transformation
    Uppercase:                    'Á' (U+00C1)
    Lowercase:                    'á' (U+00E1)

    ## Encoding Information
    UTF-8:                        b'\xc3\xa1' (2 bytes)
    UTF-8 binary:                 1100 0011  1010 0001
    URL encode:                   %C3%A1

    ## Normalization Forms
    Decomposition info (NFD):     'á' = (U+0061 (LATIN SMALL LETTER A) + U+0301 (COMBINING ACUTE ACCENT))

    ## Web & Markup
    HTML entity:                  &aacute;
    HTML numeric:                 &#225; or &#x00E1;
    JSON escape:                  \u00e1

    $ char
    Char: helló
    ===
    Error: provide a single character
    It contains 5 characters.
    NFKC decomposition: helló (U+0068 0065 006C 006C 00F3)
```

Everything you wanted to know about a character :)

If some info is missing, let me know.

### (10) cop: Copy a file interactively

[cop.fish](functions/cop.fish)

```shell
    $ cop main.c
    Copy's name: main.c
    # you can edit the file's name (move the cursor, delete a char, etc.)
```

It allows you to copy a file interactively.

### (11) crepl: Start the C REPL

[crepl.fish](functions/crepl.fish)

```shell
    $ crepl
    C REPL v0.0.2 by Jabba Laci (jabba.laci@gmail.com), 2025
    >>>
```

It starts my interactive C REPL. The project can be found here: https://github.com/jabbalaci/c-repl

### (12) ct: Start CudaText

[ct.fish](functions/ct.fish)

Start cudatext (text editor) in the background.

Under Manjaro, it's in the package `cudatext-qt5-bin`.

### (13) cut-info: Basic usage of the cut command

[cut-info.fish](functions/cut-info.fish)

```shell
    $ cut-info
    # print some info about its basic usage
```

### (14) dname: Print just the current directory name

[dname.fish](functions/dname.fish)

```shell
    $ pwd
    /home/jabba/.config/fish

    $ dname
    fish
```

### (15) dos-greeting: Classical DOS starting screen

[dos-greeting.fish](functions/dos-greeting.fish)

```shell
    $ dos-greeting
    Starting MS-DOS...

    HIMEM is testing extended memory...done.
```

For fun. Tip: combine it with `dos-prompt`.

### (16) dos-prompt: Activate the DOS prompt

[dos-prompt.fish](functions/dos-prompt.fish)

```shell
    $ pwd
    /home/jabba

    $ dos-prompt
    C:\Users\jabba>
```

It changes the prompt to a DOS-style prompt. Tip: combine it with `dos-greeting`.

### (17) edit2: Edit two files side by side

[edit2.fish](functions/edit2.fish)

```shell
    $ edit2 file1 file2
    # opens both files in a text editor side by side
```

It opens the two files with the [micro](https://micro-editor.github.io/)
text editor (my favourite) side by side.

Same thing with vim: `vim -O file1 file2`

### (18) edits: Print editing possibilities

[edits.fish](functions/edits.fish)

```shell
    $ edits
    # prints some help about the editing possibilities
```

It just prints a text that sums up my aliases / functions
used for editing. How to edit `config.sh`, aliases, etc.

### (19) ef: Edit the given function

[ef.fish](functions/ef.fish)

```shell
    $ ef upper
    # opens upper.fish in your text editor

    $ ef upper.fish
    # using the .fish extension is optional
```

**e**dit a **f**unction from anywhere

### (20) efs: Edit the given function's corresponding script

[efs.fish](functions/efs.fish)

```shell
    $ efs char
    # opens ~/.config/fish/myscripts/char.py in a text editor
```

**e**dit **f**unction's **s**cript

Sometimes, a function is just a wrapper (launcher) for a script.
For instance, `~/.config/fish/functions/char.fish` calls `~/.config/fish/myscripts/char.py`.
With `efs char`, you can edit `char.py`.

### (21) epair: Edit the given function and its pair (ex.: hex and unhex)

[epair.fish](functions/epair.fish)

```shell
    $ epair bin
    # opens bin.fish and unbin.fish in your text editor

    $ epair unbin
    # opens unbin.fish and bin.fish in your text editor
```

**e**dit a **pair** of functions from anywhere

If a function has an un*.fish pair, then you can edit both of them
in your text editor side by side. The `micro` text editor is used by default.

### (22) ex: Universal archive extractor

[ex.fish](functions/ex.fish)

```shell
    $ ex file.zip
    # extracts the archive
```

A universal solution for extracting any archive.

### (23) exit_code: Produce the given exit code

[exit_code.fish](functions/exit_code.fish)

```shell
    $ exit_code 3
    $ echo $status
    3
```

Produce the given exit code. For testing purposes.

### (24) feh-slideshow: Start a slideshow with feh

[feh-slideshow.fish](functions/feh-slideshow.fish)

```shell
    $ feh-slideshow
    # start slideshow in the current directory
```

Meaning of the options:

* `-D 5`:          5 sec. delay
* `-F`:            fullscreen
* `-Z`:            auto-zoom images to fit screen

### (25) filters: My filters

[filters.fish](functions/filters.fish)

```shell
    $ filters
    # prints my filters
```

It just prints a list of my filters.
The filters are organized into categories.
I must update this list manually.

### (26) find_conflicted_copies: Find conflicted copies in your Dropbox folder

[find_conflicted_copies.fish](functions/find_conflicted_copies.fish)

```shell
    $ find_conflicted_copies
    ./.git/index (jabba-logic's conflicted copy 2025-05-27)
    ...
```

The Dropbox client sometimes produces conflicted copies.
This function lists them.

### (27) fish_command_not_found: Ubuntu-like suggestion when a command is not found

[fish_command_not_found.fish](functions/fish_command_not_found.fish)

```shell
    $ mc
    fish: Unknown command: mc
    extra/mc
```

Provides an Ubuntu-like suggestion when a command is not found.

### (28) fish_greeting: Default greeting message

[fish_greeting.fish](functions/fish_greeting.fish)

When you open a new terminal / tab, this function is called automatically.
With this you can print some greeting message before the first prompt.

If this function doesn't print anything on the screen, then there's no
greeting message. If you want to disable messages, just leave its body empty.

### (29) fish_prompt: Jabba's prompt

[fish_prompt.fish](functions/fish_prompt.fish)

This function provides the prompt before the cursor.
Edit it to create your own cool prompt.

### (30) function-descriptions: Functions and their descriptions

[function-descriptions.fish](functions/function-descriptions.fish)

```shell
    $ function-descriptions
    * addprefix                     - Add prefix to every line (filter)
    * addsuffix                     - Add suffix to every line (filter)
    ...
```

List functions with their descriptions.

Here I wanted the list of "real" functions, without aliases.
In Fish, aliases are turned into functions behind the scenes. So I wanted to filter them out.

* A: function names (with aliases)
* B: aliases
* Print A\B (difference)

### (31) get-function-description: Print the description of a function

[get-function-description.fish](functions/get-function-description.fish)

```shell
    $ get-function-description upper
    Convert to uppercase (filter)
```

Prints the description of the given function.

### (32) gitup: Upload local changes to the git repo

[gitup.fish](functions/gitup.fish)

```shell
    $ gitup
    # uploads local changes to the git repo
```

Uploads local changes to the git repo.

The process is broken down into 3 steps: add, commit, push.
The process can be terminated at any time.

### (33) good_shape_manjaro: Update the list of mirror servers, find the fastest ones

[good_shape_manjaro.fish](functions/good_shape_manjaro.fish)

```shell
    $ good_shape_manjaro
    # updates mirror servers
```

On Manjaro Linux, it updates the list of mirror servers and sorts them by response time.

It only checks mirror servers of your continent.

### (34) gpu-info: GPU info

[gpu-info.fish](functions/gpu-info.fish)

```shell
    $ gpu-info
    # inxi -G
    Graphics:
      Device-1: Intel CometLake-S GT2 [UHD Graphics 630] driver: i915 v: kernel
      Display: x11 server: X.Org v: 21.1.16 driver: X: loaded: modesetting
        dri: iris gpu: i915 resolution: N/A
      API: Vulkan v: 1.4.313 drivers: intel surfaces: N/A
      API: OpenGL Message: Unable to show GL data. glxinfo is missing.
      Info: Tools: api: vulkaninfo de: xfce4-display-settings
        x11: xdpyinfo, xprop, xrandr
```

Prints info about your GPU.

### (35) hxd: Start HxD

[hxd.fish](functions/hxd.fish)

HxD is an excellent hex editor. This is a Windows software,
available at https://mh-nexus.de/en/hxd/ . If you know a better
Linux alternative, let me know. We start it with wine.

### (36) isodate: Print date in YYYY-MM-DD format

[isodate.fish](functions/isodate.fish)

```shell
    $ isodate
    2025-05-21
```

Prints date in YYYY-MM-DD format.

Fun fact: in Hungary we use this format.
We're going from the big picture towards the details, not vice versa.

### (37) isodatetime: Print timestamp in YYYY-MM-DDTHH:MM:SS format

[isodatetime.fish](functions/isodatetime.fish)

```shell
    $ isodatetime
    2025-05-21T13:57:28
```

Can be used as a timestamp.

### (38) jive: Start the JiVE image viewer

[jive.fish](functions/jive.fish)

```shell
    $ jive
    # starts my JiVE image viewer
```

JiVE is an image viewer with some built-in NSFW support...

The project can be found here: https://github.com/jabbalaci/JiVE-Image-Viewer

### (39) json: Print key/value pairs in a JSON file

[json.fish](functions/json.fish)

```shell
    $ cat person.json
    {
        "last": "Doe",
        "first": "John",
        "daughter": {
            "last": "Doe",
            "first": "Jane"
        }
    }

    $ json person.json
    root['last'] => 'Doe'
    root['first'] => 'John'
    root['daughter']['last'] => 'Doe'
    root['daughter']['first'] => 'Jane'
```

The project can be found here: https://github.com/jabbalaci/JSON-path

### (40) kpx: Start keepassxc

[kpx.fish](functions/kpx.fish)

```shell
    $ kpx
    # starts keepassxc
```

This is a launcher for keepassxc.

[KeePassXC](https://keepassxc.org/) is an excellent, cross-platform password manager.

### (41) machine_id: Print the machine ID

[machine_id.fish](functions/machine_id.fish)

```shell
    $ machine_id
    i9-uni-office
```

I store a lot of things in Dropbox, thus I have the same environment on all my machines.
However, sometimes a program should behave differently on a specific machine.
I came up with the idea to create the file `~/MACHINE_ID`, which contains a unique
identifier string. This file is not synced among my computers. A program/script can
query the value of this file and set itself accordingly.

### (42) malap: Multi alap, i.e. call my program `alap` with each argument

[malap.fish](functions/malap.fish)

```shell
    $ malap c d py
    # `main.c` was created
    # `main.d` was created
    # `main.py` was created
```

`alap` ( https://github.com/jabbalaci/alap ) is a little CLI tool of mine for scaffolding files.
By default, it accepts just one argument, but with this function
I can call it with several ones.

(The word "alap" means "base" or "basic" in Hungarian.)

### (43) mc: Launch Midnight Commander and stay in the folder where you quit

[mc.fish](functions/mc.fish)

```shell
    $ mc
    # starts Midnight Commander
```

Use this function to start Midnight Commander. This way, when you
navigate somewhere in MC and quit, you'll find yourself in the
directory where you quit.

Without this, you'd get back to the folder where you launched MC.

### (44) mdgo: Make directory and cd into it

[mdgo.fish](functions/mdgo.fish)

```shell
    $ pwd
    /tmp

    $ mdgo send

    $ pwd
    /tmp/send
```

Makes the directory and enters into it. Others like to call it `mdcd`.

### (45) meteo: Weather report

[meteo.fish](functions/meteo.fish)

```shell
    $ meteo paris,france
    Weather:
      Report: temperature: 24.22 C (76 F) conditions: clear sky
      Locale: Paris, France current time: 2025-05-30 22:49:15
        Source: OpenWeatherMap.org
```

The location's format is `city,country` . It's a string with no space in it.
In case of problems, consult OpenWeatherMap.org

### (46) minimal-prompt: A minimal prompt

[minimal-prompt.fish](functions/minimal-prompt.fish)

```shell
    $ minimal-prompt
    # you get a simple $ sign for your prompt
```

Might be useful if you want to do a demo and you want to hide your fancy prompt
to avoid distraction.

### (47) moodle-link: Put a link on the given URL without embedding it | Moodle

[moodle-link.fish](functions/moodle-link.fish)

```shell
    $ moodle-link
    Insert a clickable (YouTube) link without embedding the video | Moodle

    URL: https://www.youtube.com/watch?v=dQw4w9WgXcQ
    '<a style="color: rgb(57, 155, 226);" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ#" target="_blank">https://www.youtube.com/watch?v=dQw4w9WgXcQ</a>'
    # copied to the clipboard
```

An interactive script that reads a URL and produces a string
that can be pasted in the source code of a Moodle page.
It inserts a clickable link and prevents embedding.

### (48) moodle-nolink: Insert a URL as text, without putting a link on it | Moodle

[moodle-nolink.fish](functions/moodle-nolink.fish)

```shell
    $ moodle-nolink
    Insert a URL as simple text, not as a hyperlink | Moodle

    URL: https://www.youtube.com/watch?v=2hPOfpI7j_Y
    '<span class="nolink">https://www.youtube.com/watch?v=2hPOfpI7j_Y</span>'
    # copied to the clipboard
```

It produces a string that can be pasted in the source code of a Moodle page.
The link (URL) will appear as a normal text, not as a hyperlink.

### (49) myalias: Similar to the alias in bash

[myalias.fish](functions/myalias.fish)

```shell
    $ myalias rm
    alias rm 'rm -i'

    $ myalias
    # list of all my aliases
```

`myalias` works similarly to `alias` in Bash/ZSH.

### (50) no-autosuggestions: Disable autosuggestions

[no-autosuggestions.fish](functions/no-autosuggestions.fish)

```shell
    $ no-autosuggestions
```

Disables autosuggestions. As you type, nothing will appear in gray after the cursor.

Might be useful when you do a demo and others can see your screen and
you don't want to reveal what files you downloaded last time with wget...

### (51) no-theme: Select the None theme (no colors)

[no-theme.fish](functions/no-theme.fish)

```shell
    $ no-theme
    # no colors as you type
```

As you type, everything has the same color.

By default, fish adds colors to syntactic elements.
With `no-theme` you can disable it.

### (52) private-mode: Start private mode, history will not be persisted

[private-mode.fish](functions/private-mode.fish)

```shell
    $ private-mode
    # start a private session
```

In private mode history will not be persisted.

### (53) pyeval: Evaluate an expression with Python

[pyeval.fish](functions/pyeval.fish)

```shell
    $ echo 8 - 5 | pyeval
    3

    $ echo "2**20" | pyeval
    1048576

    $ echo "'laci'.upper()" | pyeval
    LACI

    $ echo "r.randint(1, 6)" | pyeval
    2
```

The input is evaluated with Python's `eval()`
function, so BE CAREFUL what you pass to it!

### (54) pyloc: Count Python lines of code (excluding .venv)

[pyloc.fish](functions/pyloc.fish)

```shell
    $ pyloc
     143 ./lib.py
      24 ./02-functions_to_md.py
     104 ./01-filters_to_md.py
     271 total
```

Traverses the current directory recursively (excluding .venv),
and counts Python lines of code.

### (55) python3clean: Start the Python 3 REPL without the extra info line

[python3clean.fish](functions/python3clean.fish)

```shell
    $ python3clean
    Python 3.13.3 (main, Apr  9 2025, 07:44:25) [GCC 14.2.1 20250207] on linux
    >>>
```

By default, the Python 3 REPL starts like this:

```shell
    $ python3
    Python 3.13.3 (main, Apr  9 2025, 07:44:25) [GCC 14.2.1 20250207] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
```

Notice the extra line that starts with "Type...". We don't need that line.
This function removes it.

Tip: this function has a long name so I suggest putting an alias on it.

### (56) qj: QuickJump script

[qj.fish](functions/qj.fish)

```shell
    $ cd /

    $ pwd
    /

    $ qj db

    $ pwd
    /home/jabba/Dropbox
```

This is a launcher for my QuickJump script.
Available here: https://github.com/jabbalaci/quickjump

### (57) r: Run a source code (compile and run)

[r.fish](functions/r.fish)

```shell
    $ r main.c
    Hello World

    $ r sum.c 2 3
    5
```

Takes a source code and runs it. It can be extended to support various languages.

### (58) random-functions: Some random functions (so that you don't forget them)

[random-functions.fish](functions/random-functions.fish)

```shell
    $ random-functions
    * unroman                       - Convert Roman numeral to number (filter)
    * sp                            - Show the current path or show the path of a given file
    * removesuffix                  - Remove suffix (filter)
```

It prints some random functions (real functions and filters, but no aliases).

Tip: call it from `fish_greeting`. It's easy to forget about your functions,
especially if you have many, so we need constant reminders.

How it works:

* A: function names (with aliases)
* B: aliases
* Print A\B (difference)

### (59) re: Wake up the Dropbox client

[re.fish](functions/re.fish)

```shell
    $ re
    # the Dropbox client starts synchronizing
```

When I wake up a computer from suspend mode, sometimes the Dropbox client
doesn't recognize that it should start synchronizing. With this script
I can force it to start working.

### (60) ren: Rename a file interactively

[ren.fish](functions/ren.fish)

```shell
    $ ren main.c
    New name: main.c
    # you can edit the file's name (move the cursor, delete a char, etc.)
```

It allows you to rename a file interactively.

### (61) repo: Open the GitHub URL of the current project

[repo.fish](functions/repo.fish)

```shell
    $ repo
    # opens the GitHub URL of the current project
```

Under Manjaro, install this package:

```
yay -S github-cli
```

Under Manjaro, after an update, this command dropped some warnings.
The solution was to reinstall some packages:

```
sudo pacman -Syu mesa vulkan-intel ibus
```

### (62) resolution: Current resolution

[resolution.fish](functions/resolution.fish)

```shell
    $ resolution
    1920x1080
```

Shows your current resolution.

### (63) s: CD into /tmp/send

[s.fish](functions/s.fish)

```shell
    $ pwd
    /home/jabba

    $ s

    $ pwd
    /tmp/send
```

I like to store short-living temporary files in the `/tmp/send` folder.
It's in `/tmp`, but still in a separate subfolder. For instance, I need to send
3 files to a friend that are located in different folders. I copy them to
`/tmp/send`, send them via email (since they are collected in the same folder,
it's easy to attach them), then delete them from `/tmp/send`.

This script called `s` allows me to enter this folder with the speed of light.

### (64) sort-info: Basic usage of the sort command

[sort-info.fish](functions/sort-info.fish)

```shell
    $ sort-info
    # print some info about its basic usage
```

### (65) sp: Show the current path or show the path of a given file

[sp.fish](functions/sp.fish)

```shell
    $ pwd
    /tmp/send

    $ sp
    # copied to the clipboard
    /tmp/send

    $ sp main.c
    # copied to the clipboard
    /tmp/send/main.c
```

`sp` stands for **s**how **p**ath.

`sp` alone shows the current directory and copies it to the clipboard.

`sp <filename>` shows the path of the given file and copies the file's
path to the clipboard.

`sp.py` can be found here: https://github.com/jabbalaci/Bash-Utils/blob/master/sp.py

### (66) timezones: List of valid timezones

[timezones.fish](functions/timezones.fish)

```shell
    $ timezones
    Africa/Abidjan
    Africa/Accra
    ...
```

See also https://worldtimeapi.org/pages/examples .

### (67) top10dirs: Top 10 largest directories

[top10dirs.fish](functions/top10dirs.fish)

```shell
    $ top10dirs
    367G    .
    107G    ./retroujsag
    91G     ./youtube
    39G     ./byte_magazine
    ...
```

List the top 10 directories in the current folder in descending order by size.

### (68) top10files: Top 10 largest files

[top10files.fish](functions/top10files.fish)

```shell
    $ top10files
    5,8G    ./install/ubuntu/ubuntu-24.04.1-desktop-amd64.iso
    5,6G    ./install/commodore_os_vision/CommodoreOS-20231213.iso
    ...
```

List the top 10 files in the current folder (recursively) in descending order by size.

### (69) tr-info: Basic usage of the tr command

[tr-info.fish](functions/tr-info.fish)

```shell
    $ tr-info
    # print some info about its basic usage
```

### (70) unixtime: Print the Unix epoch time

[unixtime.fish](functions/unixtime.fish)

```shell
    $ unixtime
    1747902871

    $ unixtime2date 1747902871
    2025-05-22 10:34:31
    2025. máj. 22., csütörtök, 10:34:31 CEST
```

Prints the Unix epoch time, i.e. the number of seconds
since January 1, 1970.

`unixtime2date` is the opposite.

### (71) unixtime2date: Convert Unix epoch time to normal date

[unixtime2date.fish](functions/unixtime2date.fish)

```shell
    $ unixtime
    1747902871

    $ unixtime2date 1747902871
    2025-05-22 10:34:31
    2025. máj. 22., csütörtök, 10:34:31 CEST
```

Takes a Unix epoch time (number) and converts it
back to human-friendly date.

### (72) upgrade_pipx_and_uv: Upgrade packages installed with pipx and uv

[upgrade_pipx_and_uv.fish](functions/upgrade_pipx_and_uv.fish)

```shell
    $ upgrade_pipx_and_uv
    # updates packages that were installed with pipx and uv
    # it also updates uv (which gets a new version almost every week)
```

`pipx` and `uv` are two popular package managers for Python.
They have that nice feature that they can update all the packages
that were installed with them. This script triggers this update procedure.

### (73) ups: Updates / upgrades

[ups.fish](functions/ups.fish)

```shell
    $ ups
    # brings up a "menu" with all the update/upgrade possibilities
```

This script brings up a "menu" from which I can select the update/upgrade option.
I regularly need to update the mirror list, upgrade the packages,
upgrade softwares installed with pipx and uv, etc. I cannot keep
all the update commands in my head. This script helps me keep
my system up-to-date without causing any mental overhead.

### (74) ut: Run unittests on a D source file

[ut.fish](functions/ut.fish)

```shell
    $ ut file.d
    # run unittests of `file.d` using rdmd
    $ ut file.d -main
    # if `file.d` is a library, then an empty main() function is added
```

Run unittests on the given D source code using `rdmd`.

### (75) uv_venv: Call the `uv_venv` script

[uv_venv.fish](functions/uv_venv.fish)

```shell
    $ uv init

    $ uv_venv
```

See https://github.com/jabbalaci/uv_venv for a detailed description.

In short:

The command uv venv creates `.venv/` in the project folder.

This script creates the virt. env. in a separate folder (`~/.virtualenvs`), and in the project folder
it creates a symbolic link called `.venv` that points on the virt. env. located in `~/.virtualenvs`.

### (76) workspace: Identify the current workspace

[workspace.fish](functions/workspace.fish)

I use Manjaro with XFCE and I assigned it to Super+s the following way:

Open Settings → Keyboard → Application Shortcuts, then add this command:

`fish -c 'workspace'`

Advantage: it works globally. Unfortunately, the terminal didn't recognize the Super key.

### (77) xfce-info: Current XFCE version

[xfce-info.fish](functions/xfce-info.fish)

```shell
    $ xfce-info
    # starts a GUI app.
```

Starts a GUI application where you can check the version of your XFCE.

Tip: the `fastfetch` command can also tell you this information in the command line.

### (78) xrates: Currency rates of HUF, EUR and USD

[xrates.fish](functions/xrates.fish)

```shell
    $ xrates
    1 EUR is 404.86 HUF
    1 USD is 355.87 HUF

    $ xrates 185
    1 EUR is 404.86 HUF
    1 USD is 355.87 HUF
    ---
    185.00 EUR is 74898.79 HUF
    185.00 USD is 65836.30 HUF
```

See https://frankfurter.dev for more info. It's a free, open-source currency data API
that tracks reference exchange rates.

You can pass an optional value to the function.

### (79) y: Start yazi (and stay in the folder where you quit)

[y.fish](functions/y.fish)

```shell
    $ y
    # starts the yazi file manager
```

Use this function to start yazi. This way, when you
navigate somewhere in yazi and quit, you'll find yourself in the
directory where you quit.

Without this, you'd get back to the folder where you launched yazi.

### (80) zoli: Check my friend's local time

[zoli.fish](functions/zoli.fish)

```shell
    $ zoli
    🇭🇺 Debrecen Time:   2025-05-31 21:29:59 (CEST)
    🇺🇸 US Eastern Time: 2025-05-31 15:29:59 (EDT)
```

Check my friend's local time.

<!-- END: functions -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Links

* https://fishshell.com
* [Reddit announcement](https://old.reddit.com/r/fishshell/comments/1kr3jtp/70_useful_filter_functions/)

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
