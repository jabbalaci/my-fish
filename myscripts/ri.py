#!/usr/bin/env python3

"""
A simple script to compile and launch a Fortran main program.
Modules can be in the current directory and in the `src/` subdirectory.
The script tries to compile the source files (the imported modules too)
in the correct order.

Usage:

$ ri main.f90
"""

import os
import sys
from collections import defaultdict
from pprint import pprint

COMPILER = "gfortran"
SRC_DIRS = [".", "src"]  # look for files in these folders, in this order
# DEBUG = True  # show data structures for debugging
DEBUG = False


def found(fname: str, location: list[str]) -> bool:
    return len(location) > 0


def locate(fname: str) -> list[str]:
    result: list[str] = []
    for dir in SRC_DIRS:
        if os.path.isfile(f"{dir}/{fname}"):
            result.append(dir)
        #
    #
    return result


class Graph:
    def __init__(self, fname: str) -> None:
        self.fname: str = fname
        # dependencies, file_name: [included_file_1, included_file_2, ...]
        self.deps: defaultdict[str, list[str]] = defaultdict(list)
        self.filenames: list[str] = []  # files to compile in the correct order
        self.location: dict[str, str] = {}  # location of a source file

    def start(self) -> None:
        self.process(self.fname)
        if DEBUG:
            pprint(self.deps)
        self.traverse(self.fname)
        if DEBUG:
            print(self.filenames)

    def add_to_set(self, fname: str) -> None:
        if fname not in self.filenames:
            self.filenames.append(fname)

    def traverse(self, fname: str) -> None:
        for f in self.deps.get(fname, []):
            self.traverse(f)
            self.add_to_set(f)
        #
        self.add_to_set(fname)

    def check(self, fname: str, location: list[str]) -> None:
        # it can be present max. 1x
        if len(location) > 1:
            print(f"Error: the file {fname} is present in multiple folders: {location}")
            exit(1)
        #

    def get_path(self, fname: str) -> str:
        loc = self.location[fname]
        if loc == ".":
            return fname
        # else
        return loc + "/" + fname

    def process(self, fname: str) -> None:
        loc = locate(fname)
        self.check(fname, loc)
        if not found(fname, loc):
            return
        # if the file exists and it's present just once:
        self.location[fname] = loc[0]
        f = open(self.get_path(fname))
        for line in f:
            line = line.strip().lower()
            if line.startswith("use "):
                if "intrinsic" in line:
                    return
                # else:
                left = line.split(",")[0]
                name = left.removeprefix("use ").strip() + ".f90"
                loc = locate(name)
                self.check(name, loc)
                if found(name, loc):
                    self.deps[fname].append(name)
                #
                if name not in self.deps:
                    self.process(name)
            #
        #
        f.close()

    def get_compile_command(self) -> str:
        cmd = f"{COMPILER} "
        jsrc = ""
        if os.path.isdir("src"):
            jsrc = "-Jsrc "  # where to store the *.mod files
        #
        cmd += jsrc
        cmd += " ".join([self.get_path(f) for f in self.filenames])
        cmd = f"{cmd} && ./a.out"
        return cmd


def main():
    args = sys.argv[1:]
    if len(args) == 0:
        print("Error: provide a file name", file=sys.stderr)
        exit(1)
    # else
    fname = args[0]

    g = Graph(fname)
    g.start()
    cmd = g.get_compile_command()
    print("#", cmd)
    if not DEBUG:
        os.system(cmd)


##############################################################################

if __name__ == "__main__":
    main()
