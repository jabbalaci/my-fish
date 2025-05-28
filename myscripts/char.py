#!/usr/bin/env python3

import sys
import unicodedata
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


def process(ch: char) -> None:
    if len(ch) != 1:
        print("Error: provide a single character")
        sys.exit(1)
    # else:
    code = ord(ch)
    text = "ASCII code:                  "
    if code > 127:
        text = "Unicode code point (decimal):"
    print(text, code)
    print("Unicode code point (hex):    ", f"U+{ord(ch):04X}")
    print("In binary:                   ", nibbles(to_binary(code)))
    #
    print("Unicode name:                ", unicodedata.name(ch, "--"))
    category_abbr = unicodedata.category(ch)
    category_desc = category_map.get(category_abbr, "Unknown Category")
    print(f"Category:                     {category_abbr} ({category_desc})")
    print("Uppercase:                   ", ch.upper())
    print("Lowercase:                   ", ch.lower())
    #
    utf8 = ch.encode("utf-8")
    byte_or_bytes = "byte" if len(utf8) == 1 else "bytes"
    print(f"UTF-8:                        {utf8} ({len(utf8)} {byte_or_bytes})")
    print("In binary:                    ", end="")
    for b in utf8:
        print(nibbles(to_binary(b)), end="  ")
    print()
    nfd_form = unicodedata.normalize("NFD", ch)
    if nfd_form != ch:
        decomposed_info = f"{nfd_form} = ("
        decomposed_info += " + ".join(
            [f"U+{ord(c):04X} ({unicodedata.name(c, '')})" for c in nfd_form]
        )
        decomposed_info += ")"
    else:
        decomposed_info = "None"
    print("Decomposition info:          ", decomposed_info)


def main():
    ch = input("Char: ")
    print("---")
    process(ch)


##############################################################################

if __name__ == "__main__":
    main()
