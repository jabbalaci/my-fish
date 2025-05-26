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

### (10) ex.thumbnail: Extract the URL of a YouTube video's thumbnail

[ex.thumbnail.fish](functions/ex.thumbnail.fish)

```shell
    $ echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg

    $ echo "https://www.youtube.com/watch?v=GFxH8bi4Qps" | ex.thumbnail open
    https://i.ytimg.com/vi/GFxH8bi4Qps/maxresdefault.jpg
    # and it also opens the thumbnail with the default image viewer
```

It extracts the URL of the thumbnail of a YouTube video.

### (11) ex.title: Extract HTML title from a webpage

[ex.title.fish](functions/ex.title.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.title
    fish shell
```

It was extracted from `<title>fish shell</title>`.

### (12) ex.urls: Extract all URLs

[ex.urls.fish](functions/ex.urls.fish)

```shell
    $ curl -s https://fishshell.com/ | ex.urls
    https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js
    https://oss.maxcdn.com/respond/1.4.2/respond.min.js
    ...
```

### (13) filesize: Convert filesize [bytes] to human-readable format

[filesize.fish](functions/filesize.fish)

```shell
    $ echo 123456 | filesize
    120.56 KB
```

### (14) flip: Flip input text upside down using Unicode

[flip.fish](functions/flip.fish)

```shell
    $ echo "Fish shell" | flip
    ʃʃǝɥs ɥsᴉℲ

    $ echo "Fish shell" | flip | unflip
    Fish shell
```

### (15) freq: Word frequency [simple, case-insensitive]

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

### (16) getcol: Split the input on whitespace and print the column indicated

[getcol.fish](functions/getcol.fish)

```shell
    $ echo 1 2 | getcol 2
    2
```

**get** the given **col**umn

### (17) getrow: Print the row of the input indicated

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

### (18) hex: Decimal number to hex

[hex.fish](functions/hex.fish)

```shell
    $ echo 2025 | hex
    0x7e9

    $ echo 2025 | hex | unhex
    2025
```

### (19) hexview: Show hex values of the input

[hexview.fish](functions/hexview.fish)

```shell
    $ echo "ab cd" | hexview
    a61 b62 ␣20 c63 d64 ␤0A

    $ echo -n "ab cd" | hexview
    a61 b62 ␣20 c63 d64
    # echo -n: no newline character
```

In front of a hex value it also shows the character for easier identification.
If the character is non-printable, then a dot (`.`) is shown.
Tab, newline, carriage return and space characters are made visible with Unicode characters.

### (20) hexview2: Show the input and the hex values of the input side-by-side

[hexview2.fish](functions/hexview2.fish)

```shell
    $ cat main.c | hexview2
    # opens an editor in split mode
    # left side: content of the file
    # right side: hex values of the lines
```

You can see the input and the hex values side-by-side.
The hex values are generated with the `hexview` filter.

### (21) justify: Fully justify text to `<width>` [default: 78]

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

### (22) len: Length of a string

[len.fish](functions/len.fish)

```shell
    $ echo "hello" | len
    5
```

### (23) longest: Length of the longest line

[longest.fish](functions/longest.fish)

```shell
    $ cat main.c | longest
    22
```

### (24) lower: Convert to lowercase

[lower.fish](functions/lower.fish)

```shell
    $ echo "hEllO" | lower
    hello

    $ echo "hEllO" | lower | upper
    HELLO
```

### (25) mirror: Mirror text using mirrored Unicode characters

[mirror.fish](functions/mirror.fish)

```shell
    $ echo "Fish shell" | mirror
    llɘʜƨ ʜƨiᖷ

    $ echo "Fish shell" | mirror | unmirror
    Fish shell
```

It might be improved with https://www.flipyourtext.com/

### (26) mixup: Mix up inner letters of each word, keeping first/last intact

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

### (27) morse: Convert text to Morse code [e.g., 'SOS' -> '... --- ...']

[morse.fish](functions/morse.fish)

```shell
    $ echo "SOS Titanic" | morse
    ... --- ... / - .. - .- -. .. -.-.

    $ echo "SOS Titanic" | morse | unmorse
    SOS TITANIC
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (28) noaccents: Remove accents [á -> a, etc.]

[noaccents.fish](functions/noaccents.fish)

```shell
    $ echo "László" | noaccents
    Laszlo
```

### (29) nonempty: Remove empty lines

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

### (30) obfuscate: Replace letters with similar-looking symbols [e -> 3, a -> @, etc.]

[obfuscate.fish](functions/obfuscate.fish)

```shell
    $ echo "This is just a sentence." | obfuscate
    7h1$ 1$ ju$7 @ $3n73nc3.
```

### (31) oct: Decimal number to octal

[oct.fish](functions/oct.fish)

```shell
    $ echo 2025 | oct
    0o3751

    $ echo 2025 | oct | unoct
    2025
```

### (32) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

[p.allext.fish](functions/p.allext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

### (33) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

[p.ext.fish](functions/p.ext.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

### (34) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

[p.fname.fish](functions/p.fname.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

### (35) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

[p.name.fish](functions/p.name.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

### (36) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

[p.parent.fish](functions/p.parent.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

### (37) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

[p.stem.fish](functions/p.stem.fish)

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

### (38) prettyjson: Pretty-print JSON

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

### (39) prettynum: Prettify a number

[prettynum.fish](functions/prettynum.fish)

```shell
    $ echo 12345679 | prettynum
    12,345,679

    $ echo 12345679 | prettynum '_'
    12_345_679
```

### (40) qrcode: Generate a QR code from text [ANSI]

[qrcode.fish](functions/qrcode.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is shown in the terminal (see [screenshot](https://i.imgur.com/WaWTdmG.png)).

### (41) qrcode2: Generate a QR code from text [PNG]

[qrcode2.fish](functions/qrcode2.fish)

```shell
    $ echo "https://fishshell.com/" | qrcode2
```

It requires the `qrencode` package (`yay -S qrencode`).
The QR code is saved as a PNG and opened automatically with the default image viewer
(see [screenshot](https://i.imgur.com/DrFVW2i.png)).

### (42) quote: Create GET-style quoted text

[quote.fish](functions/quote.fish)

```shell
    $ echo "largest prime below 1 million" | quote
    largest+prime+below+1+million

    $ echo "largest prime below 1 million" | quote | unquote
    largest prime below 1 million
```

### (43) quotes: Add quotes around the input

[quotes.fish](functions/quotes.fish)

```shell
    $ echo "hello"
    hello

    $ echo "hello" | quotes
    'hello'
```

Puts the input among quotes, making the beginning and the end of the input clearly visible.

### (44) randomcase: Alternate case randomly

[randomcase.fish](functions/randomcase.fish)

```shell
    $ echo "Hello World" | randomcase
    heLLo woRLd

    $ echo "Hello World" | randomcase
    HEllo WorLD
```

### (45) randomline: Select a non-empty random line from input

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

### (46) removeprefix: Remove prefix

[removeprefix.fish](functions/removeprefix.fish)

```shell
    $ cat main.py
    # x = 1
    # y = 2

    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

### (47) removesuffix: Remove suffix

[removesuffix.fish](functions/removesuffix.fish)

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable

    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

### (48) repeat: Repeat a text `<n>` times

[repeat.fish](functions/repeat.fish)

```shell
    $ echo "*" | repeat 5
    *****
```

### (49) replace: Replace `<old>` with `<new>`

[replace.fish](functions/replace.fish)

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

### (50) reverse: Reverse a string

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

### (51) roman: Convert number to Roman numeral [1-3999]

[roman.fish](functions/roman.fish)

```shell
    $ echo 2025 | roman
    MMXXV

    $ echo 2025 | roman | unroman
    2025
```

### (52) rot: Rotate letters with with `<n>` positions

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

### (53) shuffle: Shuffle characters in each line

[shuffle.fish](functions/shuffle.fish)

```shell
    $ echo "12345678" | shuffle
    14857362

    $ echo "12345678" | shuffle
    12563487
```

### (54) sparkline: Generate sparkline chart from numbers

[sparkline.fish](functions/sparkline.fish)

```shell
    $ echo "15 8 23 17 42 8 35 27" | sparkline
    ▂▁▅▃█▁▇▆
```

### (55) swapcase: Swap lower- and uppercase

[swapcase.fish](functions/swapcase.fish)

```shell
    $ echo "Hello World" | swapcase
    hELLO wORLD
```

### (56) take: Take the first `<n>` lines of stdin

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

### (57) tiny: Convert text to tiny superscript letters

[tiny.fish](functions/tiny.fish)

```shell
    $ echo "Fish shell" | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ

    $ echo "Fish shell" | tiny | untiny
    FiSh Shell
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (58) title: Convert to title case

[title.fish](functions/title.fish)

```shell
    $ echo "hello world" | title
    Hello World
```

### (59) trim: Trim leading/trailing whitespace

[trim.fish](functions/trim.fish)

```shell
    $ echo "     aa bb    " | trim
    aa bb

    $ echo "     aa bb    " | trim | len
    5
```

### (60) typewriter: Print like a typewriter

[typewriter.fish](functions/typewriter.fish)

```shell
    $ cat main.c | typewriter
    #include <stdio.h>

    int main...
```

The content of the file is printed character by character,
with some delay, similarly to a typewriter.

### (61) typewriter2: Print like a typewriter with sound effects

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

### (62) unbin: Binary number to decimal

[unbin.fish](functions/unbin.fish)

```shell
    $ echo 1110 | unbin
    14

    $ echo 1110 | unbin | bin
    0b1110
```

### (63) unflip: Revert upside-down Unicode text back to normal

[unflip.fish](functions/unflip.fish)

```shell
    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip
    Fish shell

    $ echo "ʃʃǝɥs ɥsᴉℲ" | unflip | flip
    ʃʃǝɥs ɥsᴉℲ
```

### (64) unhex: Hex number to decimal

[unhex.fish](functions/unhex.fish)

```shell
    $ echo ff | unhex
    255

    $ echo ff | unhex | hex
    0xff
```

### (65) unmirror: Convert mirrored text back to normal

[unmirror.fish](functions/unmirror.fish)

```shell
    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror
    Fish shell

    $ echo "llɘʜƨ ʜƨiᖷ" | unmirror | mirror
    llɘʜƨ ʜƨiᖷ
```

It might be improved with https://www.flipyourtext.com/

### (66) unmorse: Convert Morse code to text [e.g., '... --- ...' -> 'SOS']

[unmorse.fish](functions/unmorse.fish)

```shell
    $ echo "- .. - .- -. .. -.-." | unmorse
    TITANIC

    $ echo "- .. - .- -. .. -.-." | unmorse | morse
    - .. - .- -. .. -.-.
```

* International Morse code: https://www.itu.int/rec/R-REC-M.1677-1-200910-I/
* https://en.wikipedia.org/wiki/Morse_code

### (67) unoct: Octal number to decimal

[unoct.fish](functions/unoct.fish)

```shell
    $ echo 755 | unoct
    493

    $ echo 755 | unoct | oct
    0o755
```

### (68) unquote: Decode GET-style quoted text

[unquote.fish](functions/unquote.fish)

```shell
    $ echo "largest+prime+below+1+million" | unquote
    largest prime below 1 million

    $ echo "largest+prime+below+1+million" | unquote | quote
    largest+prime+below+1+million
```

### (69) unroman: Convert Roman numeral to number

[unroman.fish](functions/unroman.fish)

```shell
    $ echo MMXXV | unroman
    2025

    $ echo MMXXV | unroman | roman
    MMXXV
```

### (70) untiny: Convert tiny superscript letters back to normal text [not perfect]

[untiny.fish](functions/untiny.fish)

```shell
    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny
    FiSh Shell

    $ echo "ᶠⁱˢʰ ˢʰᵉˡˡ" | untiny | tiny
    ᶠⁱˢʰ ˢʰᵉˡˡ
```

Conversion from tiny to normal is not perfect due to some Unicode limitations.

### (71) upper: Convert to uppercase

[upper.fish](functions/upper.fish)

```shell
    $ echo "hEllO" | upper
    HELLO

    $ echo "hEllO" | upper | lower
    hello
```

### (72) urldecode: URL-decode input

[urldecode.fish](functions/urldecode.fish)

```shell
    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)

    $ echo "https%3A//en.wikipedia.org/wiki/C_%28programming_language%29" | urldecode | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29
```

### (73) urlencode: URL-encode input

[urlencode.fish](functions/urlencode.fish)

```shell
    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode
    https%3A//en.wikipedia.org/wiki/C_%28programming_language%29

    $ echo "https://en.wikipedia.org/wiki/C_(programming_language)" | urlencode | urldecode
    https://en.wikipedia.org/wiki/C_(programming_language)
```

### (74) wolfram: Ask Wolfram Alpha

[wolfram.fish](functions/wolfram.fish)

```shell
    $ echo "largest prime below 1 million" | wolfram
    999983

    $ echo "Is 31 a prime?" | wolfram
    yes
```

You need an API key for this (it's free).
API docs: https://products.wolframalpha.com/short-answers-api/documentation

### (75) zalgo: Add Zalgo (glitchy) combining characters [aggressive]

[zalgo.fish](functions/zalgo.fish)

```shell
    $ echo "Fish shell" | zalgo
    F̸̷̗̏̚ì̛͖s̞̗҆͠h͚҄҈̖̘ s̱̖̍ͪ҄̚h̭̹̳̘e̸ͥ҉҉̛̛l̗̖ͮl̤ͨ҈̙̚

    $ echo "Fish shell" | zalgo0
    F̂i͕sͥh̐ ͍s͍h̶e̚l͇l͠
```

It adds glitchy characters to the text. `zalgo` is more
aggressive than `zalgo0`.

### (76) zalgo0: Add random Unicode glitches to text [light]

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

### (3) bak: Create a backup file

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

### (4) beep: Play a beep sound

[beep.fish](functions/beep.fish)

```shell
    $ slow_command; beep
    # plays a beep sound
```

Plays a beep sound. Useful to notify you when a slow program finishes.

### (5) binds: Some useful keyboard bindings in Fish

[binds.fish](functions/binds.fish)

```shell
    $ binds
    # list some useful keyboard bindings
```

Just a reminder for me. I tend to forget these goodies.

### (6) bing: Extract the URL of the wallpaper image on bing.com

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

### (7) crepl: Start the C REPL

[crepl.fish](functions/crepl.fish)

```shell
    $ crepl
    C REPL v0.0.2 by Jabba Laci (jabba.laci@gmail.com), 2025
    >>>
```

It starts my interactive C REPL. The project can be found here: https://github.com/jabbalaci/c-repl

### (8) dname: Print just the current directory name

[dname.fish](functions/dname.fish)

```shell
    $ pwd
    /home/jabba/.config/fish

    $ dname
    fish
```

### (9) dos-greeting: Classical DOS starting screen

[dos-greeting.fish](functions/dos-greeting.fish)

```shell
    $ dos-greeting
    Starting MS-DOS...

    HIMEM is testing extended memory...done.
```

For fun. Tip: combine it with `dos-prompt`.

### (10) dos-prompt: Activate the DOS prompt

[dos-prompt.fish](functions/dos-prompt.fish)

```shell
    $ pwd
    /home/jabba

    $ dos-prompt
    C:\Users\jabba>
```

It changes the prompt to a DOS-style prompt. Tip: combine it with `dos-greeting`.

### (11) edit2: Edit two files side by side

[edit2.fish](functions/edit2.fish)

```shell
    $ edit2 file1 file2
    # opens both files in a text editor side by side
```

It opens the two files with the [micro](https://micro-editor.github.io/)
text editor (my favourite) side by side.

Same thing with vim: `vim -O file1 file2`

### (12) edits: Print editing possibilities

[edits.fish](functions/edits.fish)

```shell
    $ edits
    # prints some help about the editing possibilities
```

It just prints a text that sums up my aliases / functions
used for editing. How to edit `config.sh`, aliases, etc.

### (13) ef: Edit the given function

[ef.fish](functions/ef.fish)

```shell
    $ ef upper
    # opens upper.fish in your text editor

    $ ef upper.fish
    # using the .fish extension is optional
```

**e**dit a **f**unction from anywhere

### (14) epair: Edit the given function and its pair (ex.: hex and unhex)

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

### (15) ex: Universal archive extractor

[ex.fish](functions/ex.fish)

```shell
    $ ex file.zip
    # extracts the archive
```

A universal solution for extracting any archive.

### (16) filters: My filters

[filters.fish](functions/filters.fish)

```shell
    $ filters
    # prints my filters
```

It just prints a list of my filters.
The filters are organized into categories.
I must update this list manually.

### (17) fish_command_not_found: Ubuntu-like suggestion when a command is not found

[fish_command_not_found.fish](functions/fish_command_not_found.fish)

```shell
    $ mc
    fish: Unknown command: mc
    extra/mc
```

Provides an Ubuntu-like suggestion when a command is not found.

### (18) fish_greeting: Default greeting message

[fish_greeting.fish](functions/fish_greeting.fish)

When you open a new terminal / tab, this function is called automatically.
With this you can print some greeting message before the first prompt.

If this function doesn't print anything on the screen, then there's no
greeting message. If you want to disable messages, just leave its body empty.

### (19) fish_prompt: Jabba's prompt

[fish_prompt.fish](functions/fish_prompt.fish)

This function provides the prompt before the cursor.
Edit it to create your own cool prompt.

### (20) function-descriptions: Functions and their descriptions

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

### (21) get-function-description: Print the description of a function

[get-function-description.fish](functions/get-function-description.fish)

```shell
    $ get-function-description upper
    Convert to uppercase (filter)
```

Prints the description of the given function.

### (22) gitup: Upload local changes to the git repo

[gitup.fish](functions/gitup.fish)

```shell
    $ gitup
    # uploads local changes to the git repo
```

Uploads local changes to the git repo.

The process is broken down into 3 steps: add, commit, push.
The process can be terminated at any time.

### (23) good_shape_manjaro: Update the list of mirror servers, find the fastest ones

[good_shape_manjaro.fish](functions/good_shape_manjaro.fish)

```shell
    $ good_shape_manjaro
    # updates mirror servers
```

On Manjaro Linux, it updates the list of mirror servers and sorts them by response time.

It only checks mirror servers of your continent.

### (24) gpu-info: GPU info

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

### (25) isodate: Print date in YYYY-MM-DD format

[isodate.fish](functions/isodate.fish)

```shell
    $ isodate
    2025-05-21
```

Prints date in YYYY-MM-DD format.

Fun fact: in Hungary we use this format.
We're going from the big picture towards the details, not vice versa.

### (26) isodatetime: Print timestamp in YYYY-MM-DDTHH:MM:SS format

[isodatetime.fish](functions/isodatetime.fish)

```shell
    $ isodatetime
    2025-05-21T13:57:28
```

Can be used as a timestamp.

### (27) jive: Start the JiVE image viewer

[jive.fish](functions/jive.fish)

```shell
    $ jive
    # starts my JiVE image viewer
```

JiVE is an image viewer with some built-in NSFW support...

The project can be found here: https://github.com/jabbalaci/JiVE-Image-Viewer

### (28) json: Print key/value pairs in a JSON file

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

### (29) kpx: Start keepassxc

[kpx.fish](functions/kpx.fish)

```shell
    $ kpx
    # starts keepassxc
```

This is a launcher for keepassxc.

[KeePassXC](https://keepassxc.org/) is an excellent, cross-platform password manager.

### (30) machine_id: Print the machine ID

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

### (31) mc: Launch Midnight Commander and stay in the folder where you quit

[mc.fish](functions/mc.fish)

```shell
    $ mc
    # starts Midnight Commander
```

Use this function to start Midnight Commander. This way, when you
navigate somewhere in MC and quit, you'll find yourself in the
directory where you quit.

Without this, you'd get back to the folder where you launched MC.

### (32) mdgo: Make directory and cd into it

[mdgo.fish](functions/mdgo.fish)

```shell
    $ pwd
    /tmp

    $ mdgo send

    $ pwd
    /tmp/send
```

Makes the directory and enters into it. Others like to call it `mdcd`.

### (33) minimal-prompt: A minimal prompt

[minimal-prompt.fish](functions/minimal-prompt.fish)

```shell
    $ minimal-prompt
    # you get a simple $ sign for your prompt
```

Might be useful if you want to do a demo and you want to hide your fancy prompt
to avoid distraction.

### (34) moodle-link: Put a link on the given URL without embedding it | Moodle

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

### (35) moodle-nolink: Insert a URL as text, without putting a link on it | Moodle

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

### (36) no-autosuggestions: Disable autosuggestions

[no-autosuggestions.fish](functions/no-autosuggestions.fish)

```shell
    $ no-autosuggestions
```

Disables autosuggestions. As you type, nothing will appear in gray after the cursor.

Might be useful when you do a demo and others can see your screen and
you don't want to reveal what files you downloaded last time with wget...

### (37) no-theme: Select the None theme (no colors)

[no-theme.fish](functions/no-theme.fish)

```shell
    $ no-theme
    # no colors as you type
```

As you type, everything has the same color.

By default, fish adds colors to syntactic elements.
With `no-theme` you can disable it.

### (38) private-mode: Start private mode, history will not be persisted

[private-mode.fish](functions/private-mode.fish)

```shell
    $ private-mode
    # start a private session
```

In private mode history will not be persisted.

### (39) pyloc: Count Python lines of code (excluding .venv)

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

### (40) python3clean: Start the Python 3 REPL without the extra info line

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

### (41) qj: QuickJump script

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

### (42) r: Run a source code (compile and run)

[r.fish](functions/r.fish)

```shell
    $ r main.c
    Hello World

    $ r sum.c 2 3
    5
```

Takes a source code and runs it. It can be extended to support various languages.

### (43) random-functions: Some random functions (so that you don't forget them)

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

### (44) re: Wake up the Dropbox client

[re.fish](functions/re.fish)

```shell
    $ re
    # the Dropbox client starts synchronizing
```

When I wake up a computer from suspend mode, sometimes the Dropbox client
doesn't recognize that it should start synchronizing. With this script
I can force it to start working.

### (45) ren: Rename a file interactively

[ren.fish](functions/ren.fish)

```shell
    $ ren main.c
    New name: main.c
    # you can edit the file's name (move the cursor, delete a char, etc.)
```

It allows you to rename a file interactively.

Location of the script: https://github.com/jabbalaci/Bash-Utils/blob/master/ren.py

### (46) resolution: Current resolution

[resolution.fish](functions/resolution.fish)

```shell
    $ resolution
    1920x1080
```

Shows your current resolution.

### (47) s: CD into /tmp/send

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

### (48) skip: Skip the first `<n>` lines of stdin

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
```

Skips the first `n` lines of stdin.

### (49) sp: Show the current path or show the path of a given file

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

### (50) unixtime: Print the Unix epoch time

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

### (51) unixtime2date: Convert Unix epoch time to normal date

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

### (52) upgrade_pipx_and_uv: Upgrade packages installed with pipx and uv

[upgrade_pipx_and_uv.fish](functions/upgrade_pipx_and_uv.fish)

```shell
    $ upgrade_pipx_and_uv
    # updates packages that were installed with pipx and uv
    # it also updates uv (which gets a new version almost every week)
```

`pipx` and `uv` are two popular package managers for Python.
They have that nice feature that they can update all the packages
that were installed with them. This script triggers this update procedure.

### (53) ups: Updates / upgrades

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

### (54) uv_venv: Call the `uv_venv` script

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

### (55) xfce-info: Current XFCE version

[xfce-info.fish](functions/xfce-info.fish)

```shell
    $ xfce-info
    # starts a GUI app.
```

Starts a GUI application where you can check the version of your XFCE.

Tip: the `fastfetch` command can also tell you this information in the command line.

### (56) y: Start yazi (and stay in the folder where you quit)

[y.fish](functions/y.fish)

```shell
    $ y
    # starts the yazi file manager
```

Use this function to start yazi. This way, when you
navigate somewhere in yazi and quit, you'll find yourself in the
directory where you quit.

Without this, you'd get back to the folder where you launched yazi.

<!-- END: functions -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Links

* https://fishshell.com
* [Reddit announcement](https://old.reddit.com/r/fishshell/comments/1kr3jtp/70_useful_filter_functions/)

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
