#!/usr/bin/env python3

"""
A simple script to compile and launch a Fortran main program
that uses modules from the current folder.
The script tries to compile them in the correct order.

Usage:

$ ri main.f90
"""

import os
import sys
from pprint import pprint

deps: dict[str, str] = {}
dependencies: list[str] = []


def process(fname: str) -> None:
    if not os.path.isfile(fname):
        return
    # if the file exists:
    dependencies.append(fname)
    f = open(fname)
    for line in f:
        line = line.strip().lower()
        if line.startswith("use "):
            if "intrinsic" in line:
                return
            # else:
            left = line.split(",")[0]
            name = left.removeprefix("use ").strip() + ".f90"
            if os.path.isfile(name):
                deps[name] = fname
            if name not in dependencies:
                process(name)
            #
        #
    #
    f.close()


def main():
    args = sys.argv[1:]
    if len(args) == 0:
        print("Error: provide a file name", file=sys.stderr)
        exit(1)
    # else
    fname = args[0]
    process(fname)
    #
    # pprint(deps)
    # print(dependencies)
    dependencies.reverse()
    cmd = "gfortran " + " ".join(dependencies)
    cmd = f"{cmd} && ./a.out"
    # args[0] is the name of the file we want to compile, for ex.: $ ri main.f90
    for arg in args[1:]:
        cmd += f' "{arg}"'
    # print("#", cmd)
    os.system(cmd)


##############################################################################

if __name__ == "__main__":
    main()
