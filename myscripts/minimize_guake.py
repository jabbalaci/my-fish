#!/usr/bin/env python3

import os
import shlex
from subprocess import PIPE, STDOUT, Popen


def get_simple_cmd_output(cmd: str, stderr=STDOUT) -> str:
    """Execute a simple external command and get its output.

    The command contains no pipes. Error messages are
    redirected to the standard output by default.
    """
    args = shlex.split(cmd)
    return Popen(args, stdout=PIPE, stderr=stderr).communicate()[0].decode("utf8")


def get_wid(substring: str) -> str:
    cmd = "wmctrl -l"
    lines = get_simple_cmd_output(cmd).strip().splitlines()
    for line in lines:
        if substring in line:
            return line.split()[0]
        #
    #
    return ""


def minimize(substring: str) -> None:
    wid: str = get_wid(substring)
    if not wid:
        return
    # else
    cmd = f"xdotool windowminimize {wid}"
    os.system(cmd)


def main():
    minimize("Guake!")


##############################################################################

if __name__ == "__main__":
    main()
