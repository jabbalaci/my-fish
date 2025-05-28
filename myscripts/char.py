#!/usr/bin/env python3

import html
import json
import sys
import unicodedata
import urllib.parse
from itertools import zip_longest

char = str

# Full list: https://www.unicode.org/reports/tr44/#General_Category_Values
category_map = {
    # Letters
    "Lu": "Uppercase Letter",
    "Ll": "Lowercase Letter",
    "Lt": "Titlecase Letter",
    "Lm": "Modifier Letter",
    "Lo": "Other Letter",
    # Marks
    "Mn": "Nonspacing Mark",
    "Mc": "Spacing Mark",
    "Me": "Enclosing Mark",
    # Numbers
    "Nd": "Decimal Number",
    "Nl": "Letterlike Number",
    "No": "Other Number",
    # Punctuation
    "Pc": "Connector Punctuation",
    "Pd": "Dash Punctuation",
    "Ps": "Open Punctuation",
    "Pe": "Close Punctuation",
    "Pi": "Initial Quotation Mark",
    "Pf": "Final Quotation Mark",
    "Po": "Other Punctuation",
    # Symbols
    "Sm": "Math Symbol",
    "Sc": "Currency Symbol",
    "Sk": "Modifier Symbol",
    "So": "Other Symbol",
    # Separators
    "Zs": "Space Separator",
    "Zl": "Line Separator",
    "Zp": "Paragraph Separator",
    # Other
    "Cc": "Control Code",
    "Cf": "Format",
    "Cs": "Surrogate",
    "Co": "Private Use",
    "Cn": "Unassigned",
}


def grouper(iterable, n, fillvalue=None):
    """
    Collect data into fixed-length chunks:
    grouper('ABCDEFG', 3, 'x') --> ABC DEF Gxx

    >>> li = [1, 2, 3, 4]
    >>> [list(t) for t in helper.grouper(li, 2)]
    [[1, 2], [3, 4]]

    (from Peter Norvig's pytudes)
    """
    args = [iter(iterable)] * n
    return zip_longest(*args, fillvalue=fillvalue)


def nibbles(bits: str) -> str:
    groups = grouper(bits, 4)
    li = ["".join(t) for t in groups]
    return " ".join(li)


def to_binary(n: int) -> str:
    """
    Unicode code points range from 0 up to 0x10FFFF, thus they fit in 3 bytes (24 bits).
    """
    s = bin(n)[2:]
    length = len(s)
    if length <= 8:
        return s.zfill(8)
    if length <= 16:
        return s.zfill(16)
    # else:
    return s.zfill(24)


def to_u_plus(ch: char) -> str:
    return f"U+{ord(ch):04X}"


def get_char(ch: char) -> str:
    code = ord(ch)
    quote = "'" if ch != "'" else '"'
    if code < 32:
        return "non-printable"
    else:
        return quote + chr(code) + quote


def get_html_entity(ch: char) -> str:
    # Named entities (like &aacute;)
    # print(get_html_entity('á'))  # &aacute;
    # print(get_html_entity('😊')) # &#x1F60A;
    named_entity = html.entities.codepoint2name.get(ord(ch))
    if named_entity:
        return f"&{named_entity};"
    # else:
    # Hex entity (for chars without named equivalents)
    return f"&#x{ord(ch):04X};"


def A_basic_info(ch: str) -> None:
    print("## Basic Information")
    #
    code = ord(ch)
    print(f"Character:                    {get_char(ch)}")
    text = "ASCII code:                  "
    if code > 127:
        text = "Unicode code point (dec):    "
    print(text, code)
    print("Unicode code point (hex):    ", to_u_plus(ch))
    print("In binary:                   ", nibbles(to_binary(code)))
    #
    print("Unicode name:                ", unicodedata.name(ch, "--"))
    category_abbr = unicodedata.category(ch)
    category_desc = category_map.get(category_abbr, "Unknown Category")
    print(f"Category:                     {category_abbr} ({category_desc})")


def B_cases(ch: str) -> None:
    print("## Case & Transformation")
    #
    print(
        "Uppercase:                    {0} ({1})".format(
            get_char(ch.upper()), to_u_plus(ch.upper())
        )
    )
    print(
        "Lowercase:                    {0} ({1})".format(
            get_char(ch.lower()), to_u_plus(ch.lower())
        )
    )


def C_encoding(ch: str) -> None:
    print("## Encoding Information")
    #
    utf8 = ch.encode("utf-8")
    byte_or_bytes = "byte" if len(utf8) == 1 else "bytes"
    print(f"UTF-8:                        {utf8} ({len(utf8)} {byte_or_bytes})")
    print("UTF-8 binary:                 ", end="")
    for b in utf8:
        print(nibbles(to_binary(b)), end="  ")
    print()
    print("URL encode:                  ", urllib.parse.quote(ch))


def D_normalization(ch: str) -> None:
    print("## Normalization Forms")
    #
    nfd_form = unicodedata.normalize("NFD", ch)
    if nfd_form != ch:
        decomposed_info = f"'{nfd_form}' = ("
        decomposed_info += " + ".join(
            [f"U+{ord(c):04X} ({unicodedata.name(c, '')})" for c in nfd_form]
        )
        decomposed_info += ")"
    else:
        decomposed_info = "None"
    print("Decomposition info (NFD):    ", decomposed_info)


def E_web_and_markup(ch: str) -> None:
    print("## Web & Markup")
    #
    print("HTML entity:                 ", get_html_entity(ch))
    v1 = f"&#{ord(ch)};"
    v2 = f"&#x{ord(ch):04X};"
    print(f"HTML numeric:                 {v1} or {v2}")
    value = json.dumps(ch).replace('"', "")
    print(f"JSON escape:                  {value}")


def process(ch: str) -> None:
    if len(ch) != 1:
        print("Error: provide a single character")
        if ch:
            print(f"It contains {len(ch)} characters.")
            nfkc = unicodedata.normalize("NFKC", ch)
            nfkc_codepoints = "U+" + " ".join(f"{ord(c):04X}" for c in nfkc)
            print(f"NFKC decomposition: {nfkc} ({nfkc_codepoints})")
        #
        sys.exit(1)
    # else:

    A_basic_info(ch)
    print()
    B_cases(ch)
    print()
    C_encoding(ch)
    print()
    D_normalization(ch)
    print()
    E_web_and_markup(ch)


def print_help() -> None:
    text = """
-h, --help      This help
--dec 65        Unicode code point as decimal number (here: 'A')
--hex 41        Unicode code point as hex. number (here: 0x41 = 65, which is 'A')
--char á        Provide the character (here: 'á')
""".strip()
    print(text)


def main():
    args = sys.argv[1:]
    if ("-h" in args) or ("--help" in args):
        print_help()
        exit(0)
    #
    if "--dec" in args:
        idx = args.index("--dec")
        try:
            value = int(args[idx + 1])
        except:
            print("Error: argument error")
            sys.exit(1)
        process(chr(value))
        return
    if "--hex" in args:
        idx = args.index("--hex")
        try:
            value = int(args[idx + 1], 16)
        except:
            print("Error: argument error")
            sys.exit(1)
        process(chr(value))
        return
    if "--char" in args:
        idx = args.index("--char")
        try:
            value = args[idx + 1]
        except:
            print("Error: argument error")
            sys.exit(1)
        process(value)
        return
    # else
    try:
        ch = input("Char: ")
    except (KeyboardInterrupt, EOFError):
        print()
        exit(0)
    print("===")
    process(ch)


##############################################################################

if __name__ == "__main__":
    main()
