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

<!-- START -->

### (1) addprefix: Add prefix to every line

```shell
    $ cat main.py
    x = 1
    y = 2
    $ cat main.py | addprefix "# "
    # x = 1
    # y = 2
```

[addprefix.fish](functions/addprefix.fish)

### (2) addsuffix: Add suffix to every line

```shell
    $ cat main.py
    x = 1
    y = 2
    $ cat main.py | addsuffix " # variable"
    x = 1 # variable
    y = 2 # variable
```

[addsuffix.fish](functions/addsuffix.fish)

### (3) bin: Decimal number to binary

```shell
    $ echo 2025 | bin
    0b11111101001
    $ echo 2025 | bin | unbin
    2025
```

[bin.fish](functions/bin.fish)

### (4) capitalize: Convert to capitalized text

```shell
    $ echo "hEllO" | capitalize
    Hello
```

[capitalize.fish](functions/capitalize.fish)

### (5) collapse: Collapse multiple whitespaces into single space

```shell
    $ echo "    .aa    bb.    " | collapse
    .aa bb.
    $ echo "    .aa    bb.    " | collapse | len
    7
```

[collapse.fish](functions/collapse.fish)

### (6) hex: Decimal number to hex

```shell
    $ echo 2025 | hex
    0x7e9
    $ echo 2025 | hex | unhex
    2025
```

[hex.fish](functions/hex.fish)

### (7) len: Length of a string

```shell
    $ echo "hello" | len
    5
```

[len.fish](functions/len.fish)

### (8) lower: Convert to lowercase

```shell
    $ echo "hEllO" | lower
    hello
```

[lower.fish](functions/lower.fish)

### (9) oct: Decimal number to octal

```shell
    $ echo 2025 | oct
    0o3751
    $ echo 2025 | oct | unoct
    2025
```

[oct.fish](functions/oct.fish)

### (10) p.allext: Path [/usr/lib/a.tar.gz -> .tar.gz]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.allext
    .tar.gz
```

[p.allext.fish](functions/p.allext.fish)

### (11) p.ext: Path [/usr/lib/a.tar.gz -> .gz]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.ext
    .gz
```

[p.ext.fish](functions/p.ext.fish)

### (12) p.fname: Path [/usr/lib/stuff.tar.gz -> stuff]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.fname
    stuff
```

[p.fname.fish](functions/p.fname.fish)

### (13) p.name: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib.py]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.name
    stuff.tar.gz
```

[p.name.fish](functions/p.name.fish)

### (14) p.parent: Path [/usr/lib/python2.5/gopherlib.py -> /usr/lib/python2.5]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.parent
    /usr/lib/python2.5
```

[p.parent.fish](functions/p.parent.fish)

### (15) p.stem: Path [/usr/lib/python2.5/gopherlib.py -> gopherlib]

```shell
    $ echo /usr/lib/python2.5/stuff.tar.gz | p.stem
    stuff.tar
```

[p.stem.fish](functions/p.stem.fish)

### (16) removeprefix: Remove prefix

```shell
    $ cat main.py
    # x = 1
    # y = 2
    $ cat main.py | removeprefix "# "
    x = 1
    y = 2
```

[removeprefix.fish](functions/removeprefix.fish)

### (17) removesuffix: Remove suffix

```shell
    $ cat main.py
    x = 1 # variable
    y = 2 # variable
    $ cat main.py | removesuffix " # variable"
    x = 1
    y = 2
```

[removesuffix.fish](functions/removesuffix.fish)

### (18) repeat: Repeat a text `<n>` times

```shell
    $ echo "*" | repeat 5
    *****
```

[repeat.fish](functions/repeat.fish)

### (19) replace: Replace `<old>` with `<new>`

```shell
    $ echo "cat dog cat cat" | replace cat kitten
    kitten dog kitten kitten
```

[replace.fish](functions/replace.fish)

### (20) reverse: Reverse a string

```shell
    $ echo "hello" | reverse
    olleh
```

[reverse.fish](functions/reverse.fish)

### (21) title: Convert to title case

```shell
    $ echo "hello world" | title
    Hello World
```

[title.fish](functions/title.fish)

### (22) trim: Trim leading/trailing whitespace

```shell
    $ echo "     aa bb    " | trim | len
    5
```

[trim.fish](functions/trim.fish)

### (23) unbin: Binary number to decimal

```shell
    $ echo 1110 | unbin
    14
    $ echo 1110 | unbin | bin
    0b1110
```

[unbin.fish](functions/unbin.fish)

### (24) unhex: Hex number to decimal

```shell
    $ echo ff | unhex
    255
    $ echo ff | unhex | hex
    0xff
```

[unhex.fish](functions/unhex.fish)

### (25) unoct: Octal number to decimal

```shell
    $ echo 755 | unoct
    493
    $ echo 755 | unoct | oct
    0o755
```

[unoct.fish](functions/unoct.fish)

### (26) upper: Convert to uppercase

```shell
    $ echo "hEllO" | upper
    HELLO
```

[upper.fish](functions/upper.fish)



<!-- END -->

## Issues

If you have an idea how to improve something, or
if you find a bug, feel free to issue a ticket.

## Author
* Laszlo Szathmary (jabba.laci@gmail.com), 2025
