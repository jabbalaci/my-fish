#!/usr/bin/env python3

"""
Copy a file interactively.

It needs just one command-line argument: the name of a file
that you want to copy.

Author: Laszlo Szathmary (jabba.laci@gmail.com), 2025
"""

import os
import readline
import shutil
import sys


def rlinput(prompt, prefill=""):
    readline.set_startup_hook(lambda: readline.insert_text(prefill))
    try:
        return input(prompt)
    finally:
        readline.set_startup_hook()


def main():
    args = sys.argv[1:]
    if len(args) != 1:
        print("# error: provide just one argument!")
        sys.exit(1)
    # else
    fname = args[0]
    if os.path.isdir(fname):
        print("# error: copying a folder is not supported")
        sys.exit(1)
    if not os.path.exists(fname):
        print(f"# error: '{fname}' doesn't exist")
        sys.exit(1)
    # else
    try:
        new_name = rlinput("Copy's name: ", prefill=fname)
    except KeyboardInterrupt:
        print()
        print("# interrupted")
        return
    # if there was no exception
    if fname == new_name:
        print("# warning: you didn't change anything")
        return
    # else
    if os.path.exists(new_name):
        print(f"# error: the entry '{new_name}' already exists!")
        sys.exit(2)
    # else
    shutil.copy(fname, new_name)
    if os.path.exists(new_name):
        print(f"# '{fname}' --copy--> '{new_name}'")
    else:
        print("# something went wrong")


##############################################################################

if __name__ == "__main__":
    main()
