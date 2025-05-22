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

### (13) flip: Flip input text upside down using Unicode

[flip.fish](functions/flip.fish)

```shell
    $ echo "Fish shell" | flip
    ʃʃǝɥs ɥsᴉℲ

    $ echo "Fish shell" | flip | unflip
    Fish shell
```

### (14) freq: Word frequency [simple, case-insensitive]

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

### (15) getcol: Split the input on whitespace and print the column indicated

[getcol.fish](functions/getcol.fish)

```shell
    $ echo 1 2 | getcol 2
    2
```

**get** the given **col**umn

### (16) getrow: Print the row of the input indicated

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

### (17) hex: Decimal number to hex

[hex.fish](functions/hex.fish)

```shell
    $ echo 2025 | hex
    0x7e9

    $ echo 2025 | hex | unhex
    2025
```

### (18) hexview: Show hex values of the input

[hexview.fish](functions/hexview.fish)

```shell
    $ echo "hello" | hexview
    68 65 6C 6C 6F 0A

    $ echo -n "hello" | hexview
    68 65 6C 6C 6F
    # echo -n: no newline character
```

### (19) justify: Fully justify text to `<width>` [default: 78]

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

### (20) len: Length of a string

[len.fish](functions/len.fish)

```shell
    $ echo "hello" | len
    5
```

### (21) longest: Length of the longest line

[longest.fish](functions/longest.fish)

```shell
    $ cat main.c | longest
    22
```

### (22) lower: Convert to lowercase

[lower.fish](functions/lower.fish)

```shell
    $ echo "hEllO" | lower
    hello

    $ echo "hEllO" | lower | upper
    HELLO
```

### (23) mirror: Mirror text using mirrored Unicode characters

[mirror.fish](functions/mirror.fish)

```shell
    $ echo "Fish shell" | mirror
    llɘʜƨ ʜƨiᖷ

    $ echo "Fish shell" | mirror | unmirror
    Fish shell
```

It might be improved with https://www.flipyourtext.com/

### (24) mixup: Mix up inner letters of each word, keeping first/last intact

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

### (25) morse: Convert text to Morse code [e.g., 'SOS' -> '... --- ...']

[morse.fish](functions/morse.fish)

```shell
    $ echo "SOS Titanic" | morse
    ... --- ... / - .. - .- -. .. -.-.

    $ echo "SOS Titanic" | morse | unmorse
    SOS TITANIC
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (26) noaccents: Remove accents [á -> a, etc.]

[noaccents.fish](functions/noaccents.fish)

```shell
    $ echo "László" | noaccents
    Laszlo
```

### (27) nonempty: Remove empty lines

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

### (28) obfuscate: Replace letters with similar-looking symbols [e -> 3, a -> @, etc.]

[obfuscate.fish](functions/obfuscate.fish)

```shell
    $ echo "This is just a sentence." | obfuscate
    7h1$ 1$ ju$7 @ $3n73nc3.
```

### (29) oct: Decimal number to octal

[oct.fish](functions/oct.fish)

```shell
    $ echo 2025 | oct
    0o3751

    $ echo 2025 | oct | unoct
    2025
```

### (30) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

[p.allext.fish](functions/p.allext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

### (31) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

[p.ext.fish](functions/p.ext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

### (32) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

[p.fname.fish](functions/p.fname.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

### (33) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

[p.name.fish](functions/p.name.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

### (34) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

[p.parent.fish](functions/p.parent.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

### (35) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

[p.stem.fish](functions/p.stem.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

### (36) prettyjson: Pretty-print JSON

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

### (37) prettynum: Prettify a number

[prettynum.fish](functions/prettynum.fish)

```shell
    $ echo 12345679 | prettynum
    12,345,679

    $ echo 12345679 | prettynum '_'
    12_345_679
```

### (38) qrcode: Generate a QR code from text [ANSI]

[qrcode.fish](functions/qrcode.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is shown in the terminal (see [screenshot](https://i.imgur.com/WaWTdmG.png)).

### (39) qrcode2: Generate a QR code from text [PNG]

[qrcode2.fish](functions/qrcode2.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode2
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is saved as a PNG and opened automatically with the default image viewer
(see [screenshot](https://i.imgur.com/DrFVW2i.png)).

### (40) quote: Create GET-style quoted text

[quote.fish](functions/quote.fish)

```shell
    $ echo "largest prime below 1 million" | quote
    largest+prime+below+1+million

    $ echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
```

### (41) randomcase: Alternate case randomly

[randomcase.fish](functions/randomcase.fish)

```shell
    $ echo "Hello World" | randomcase
    heLLo woRLd

    $ echo "Hello World" | randomcase
    HEllo WorLD
```

### (42) randomline: Select a non-empty random line from input

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

### (43) removeprefix: Remove prefix

[removeprefix.fish](functions/removeprefix.fish)

```shell
    $ cat main.py
    # x = 1
    # y = 2

    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

### (44) removesuffix: Remove suffix

[removesuffix.fish](functions/removesuffix.fish)

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable

    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

### (45) repeat: Repeat a text `<n>` times

[repeat.fish](functions/repeat.fish)

```shell
    $ echo "*" | repeat 5
    *****
```

### (46) replace: Replace `<old>` with `<new>`

[replace.fish](functions/replace.fish)

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

### (47) reverse: Reverse a string

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

    $ cat book.txt | rev

### (48) roman:

[roman.fish](functions/roman.fish)

```shell
    $ echo 2025 | roman
    MMXXV

    $ echo 2025 | roman | unroman
    2025
```

### (49) rot: Rotate letters with with `<n>` positions

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

### (50) shuffle: Shuffle characters in each line

[shuffle.fish](functions/shuffle.fish)

```shell
    $ echo "12345678" | shuffle
    14857362

    $ echo "12345678" | shuffle
    12563487
```

### (51) sparkline: Generate sparkline chart from numbers

[sparkline.fish](functions/sparkline.fish)

```shell
    $ echo "15 8 23 17 42 8 35 27" | sparkline
    ▂▁▅▃█▁▇▆
```

### (52) swapcase: Swap lower- and uppercase

[swapcase.fish](functions/swapcase.fish)

```shell
    $ echo "Hello World" | swapcase
    hELLO wORLD
```

### (53) take: Take the first `<n>` lines of stdin

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
```

Take the first `n` lines of standard input.

### (54) tiny: Convert text to tiny superscript letters

[tiny.fish](functions/tiny.fish)

```shell
    $ echo "Fish shell" | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ

    $ echo "Fish shell" | tiny | untiny
    FiSh Shell
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (55) title: Convert to title case

[title.fish](functions/title.fish)

```shell
    $ echo "hello world" | title
    Hello World
```

### (56) trim: Trim leading/trailing whitespace

[trim.fish](functions/trim.fish)

```shell
    $ echo "     aa bb    " | trim
    aa bb

    $ echo "     aa bb    " | trim | len
    5
```

### (57) typewriter: Print like a typewriter

[typewriter.fish](functions/typewriter.fish)

```shell
    $ cat main.c | typewriter
    #include <stdio.h>

    int main...
```

The content of the file is printed character by character,
with some delay, similarly to a typewriter.

### (58) typewriter2: Print like a typewriter with sound effects

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

### (59) unbin: Binary number to decimal

[unbin.fish](functions/unbin.fish)

```shell
    $ echo 1110 | unbin
    14

    $ echo 1110 | unbin | bin
    0b1110
```

### (60) unflip: Revert upside-down Unicode text back to normal

[unflip.fish](functions/unflip.fish)

```shell
    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip
    Fish shell

    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip | flip
    ʃʃǝɥs ɥsᴉℲ
```

### (61) unhex: Hex number to decimal

[unhex.fish](functions/unhex.fish)

```shell
    $ echo ff | unhex
    255

    $ echo ff | unhex | hex
    0xff
```

### (62) unmirror: Convert mirrored text back to normal

[unmirror.fish](functions/unmirror.fish)

```shell
    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror
    Fish shell

    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror | mirror
    llɘʜƨ ʜƨiᖷ
```

It might be improved with https://www.flipyourtext.com/

### (63) unmorse: Convert Morse code to text [e.g., '... --- ...' -> 'SOS']

[unmorse.fish](functions/unmorse.fish)

```shell
    $ echo "- .. - .- -. .. -.-." | unmorse
    TITANIC

    $ echo "- .. - .- -. .. -.-." | unmorse | morse
    - .. - .- -. .. -.-.
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (64) unoct: Octal number to decimal

[unoct.fish](functions/unoct.fish)

```shell
    $ echo 755 | unoct
    493

    $ echo 755 | unoct | oct
    0o755
```

### (65) unquote: Decode GET-style quoted text

[unquote.fish](functions/unquote.fish)

```shell
    $ echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million

    $ echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
```

### (66) unroman:

[unroman.fish](functions/unroman.fish)

```shell
    $ echo MMXXV | unroman
    2025

    $ echo MMXXV | unroman | roman
    MMXXV
```

### (67) untiny: Convert tiny superscript letters back to normal text [not perfect]

[untiny.fish](functions/untiny.fish)

```shell
    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny
    FiSh Shell

    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (68) upper: Convert to uppercase

[upper.fish](functions/upper.fish)

```shell
    $ echo "hEllO" | upper
    HELLO

    $ echo "hEllO" | upper | lower
    hello
```

### (69) urldecode: URL-decode input

[urldecode.fish](functions/urldecode.fish)

```shell
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)

    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
```

### (70) urlencode: URL-encode input

[urlencode.fish](functions/urlencode.fish)

```shell
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29

    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
```

### (71) wolfram: Ask Wolfram Alpha

[wolfram.fish](functions/wolfram.fish)

```shell
    $ echo "largest prime below 1 million" | wolfram
    999983

    $ echo "Is 31 a prime?" | wolfram
    yes
```

You need an API key for this (it's free).
API docs: https://products.wolframalpha.com/short-answers-api/documentation

### (72) zalgo: Add Zalgo (glitchy) combining characters [aggressive]

[zalgo.fish](functions/zalgo.fish)

```shell
    $ echo "Fish shell" | zalgo
    F̸̷̗̏̚ì̛͖s̞̗҆͠h͚҄҈̖̘ s̱̖̍ͪ҄̚h̭̹̳̘e̸ͥ҉҉̛̛l̗̖ͮl̤ͨ҈̙̚

    $ echo "Fish shell" | zalgo0
    F̂i͕sͥh̐ ͍s͍h̶e̚l͇l͠
```

It adds glitchy characters to the text. `zalgo` is more
aggressive than `zalgo0`.

### (73) zalgo0: Add random Unicode glitches to text [light]

[zalgo0.fish](functions/zalgo0.fish)

```shell
    $ echo "Fish shell" | zalgo0
    F̂i͕sͥh̐ ͍s͍h̶e̚l͇l͠

    $ echo "Fish shell" | zalgo
    F̸̷̗̏̚ì̛͖s̞̗҆͠h͚҄҈̖̘ s̱̖̍ͪ҄̚h̭̹̳̘e̸ͥ҉҉̛̛l̗̖ͮl̤ͨ҈̙̚
```

It adds glitchy characters to the text. `zalgo0` is less
aggressive than `zalgo`.

<!-- END: filters -->

## Functions

Some of my functions (that are NOT filters) in
alphabetical order.

<!-- START: functions -->

TODO...

<!-- END: functions -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Links

* https://fishshell.com

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
