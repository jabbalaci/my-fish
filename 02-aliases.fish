#############################
## Aliases / abbreviations ##
#############################

alias ec="$EDITOR $FISH_DIR/config.fish"                    # edit config (this) file
alias ee="$EDITOR $FISH_DIR/01-env.fish"                    # edit env.
alias ea="$EDITOR $FISH_DIR/02-aliases.fish"                # edit aliases
alias eb="$EDITOR $FISH_DIR/03-bindings.fish"               # edit bindings
alias ep="$EDITOR $FISH_DIR/functions/fish_prompt.fish"     # edit prompt
alias eg="$EDITOR $FISH_DIR/functions/fish_greeting.fish"   # edit greeting
# ef                                                        # edit function (it exists as a function)
abbr config fish_config                                     # web-based configuration

alias path="echo $PATH | tr ':' '\n'"

# ++++++++++++++++++++++++++++++ #
# ++  function abbreviations  ++ #
# ++++++++++++++++++++++++++++++ #
# 1) alias/abbr  2) real function name
abbr timestamp isodatetime
abbr length len
abbr p.suffix p.ext
abbr p.dir p.parent
abbr wolf wolfram
abbr addpostfix addsuffix
abbr removepostfix removesuffix


# ++++++++++++++ #
# ++  others  ++ #
# ++++++++++++++ #
alias shell "ps -p $fish_pid -o comm="
alias ls='ls --color=auto'
alias ll='eza --icons --group-directories-first'  # exa is unmaintained, eza is a fork of it
# alias d="ls -al"
alias d="LC_NUMERIC=C ls -alh --group-directories-first --time-style='+%Y-%m-%d %H:%M:%S'"
alias cls 'clear'
alias cdc 'cd; clear'
alias q="cls; d"
alias ... "cd ../.."
alias .... "cd ../../.."
alias cd.. "cd .."
abbr - "cd -"
abbr p2 'python2'
abbr p3 'python3'
abbr p 'python3'
abbr pp 'python3clean'         # no extra info line
abbr f fish
abbr b bash
abbr x xonsh
alias pypy='pypy3'
alias pypy2='/opt/pypy/bin/pypy'
alias pypy3='pypy3'
alias tree="tree -C"
alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
abbr ssr "simplescreenrecorder"
alias vi $EDITOR
alias vim $EDITOR
abbr val valgrind
alias cat='bat --pager never'
alias on="source .venv/bin/activate.fish"
alias off deactivate
#
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias crontab='crontab -i'
alias md='mkdir -p'
#
abbr a "./a.out"
abbr vg valgrind
alias files "pacman -Ql"
abbr run 'chmod u+x'
abbr ff 'fastfetch'
alias nh='thunar . 2>/dev/null'    # nautilus here (replaced by thunar)
alias ssh='ssh -o ServerAliveInterval=60'
alias ppwd='/bin/pwd'
abbr jsh "jshell"
abbr ac "audacity"
abbr mongo "mongosh --quiet mytube"
alias gedit="gedit 2>/dev/null"
# The convert command is deprecated in IMv7, use "magick" instead of "convert"
abbr convert "magick"
alias book="cd /home/jabba/Dropbox/books/assembly/current; ./open.sh"
alias sysinfo="inxi -Fxxxrz"

abbr pkg "pacman -Qo"       # The given file is in which package?
abbr pkg-info "pacman -Qi"       #  package info
alias aliases alias       # plural can be used too
alias notes='code $DROPBOX/notes/notes.code-workspace'

# vi key binding
alias vi-on fish_vi_key_bindings
alias vi-off "set -U fish_key_bindings fish_default_key_bindings"

abbr dh dirh
abbr cwd pwd
abbr cmd command
alias "\cat" "command cat"
alias "ccat" "command cat"
abbr pwd-short prompt_pwd
abbr zj zellij
alias matrix="cmatrix -ab"          # yay -S cmatrix
abbr rel "clear; exec fish"         # reload configuration changes in-place
alias dlang "jkb dlang"
alias nimm "jkb nim"
alias pas "jkb pascal"
abbr clip "xsel -b"
abbr cb "xsel -b"
abbr tocb "xsel -b"
alias xxd "xxd -R never -g 1 -d"        # no color, group by 1 byte, show offset in decimal instead of hex [in package tinyxxd]
abbr mya myalias
abbr sx start_xmodmap
abbr puts echo
abbr mvv ren
abbr cpp cop
abbr dm "LC_ALL=C datamash"             # yay -S datamash
alias edge /usr/bin/microsoft-edge-stable
abbr mo marimo
alias vimv "EDITOR=nvim command vimv"
alias gallery-dl /opt/gallery-dl/gallery-dl.bin
abbr gdl gallery-dl
# alias pmwiki $DROPBOX/d_lang/pmwiki/pmwiki.py
alias pmwiki $DROPBOX/nim/pmwiki/pmwiki.py
abbr pmw pmwiki
alias rdmd "rdmd --tmpdir=$HOME/.rdmd"
abbr ldc ldc2
abbr ldmd ldmd2
abbr e2 edit2
abbr save "bm -c"
abbr drop "bm -p"
abbr df "df -h"
abbr dfh "df -h"
abbr ka killall
alias cs $DROPBOX/python/CSharpCliHelper/cs.py
alias edit msedit
abbr bmc "bm -c"  # bookmark copy
abbr bmp "bm -p"  # bookmark paste
abbr bml "bm -l"  # bookmark list
abbr bme "bm -e"  # bookmark erase
# abbr ag "antigravity . 2>/dev/null"
alias jive.="jive $(pwd)"

alias m micro
alias vim nvim

alias nvim.lac='NVIM_APPNAME="nvim.lac" nvim'
#
alias nvim.astro='NVIM_APPNAME="nvim.astro" nvim'
alias astro nvim.astro
alias nvim.chad='NVIM_APPNAME="nvim.chad" nvim'
alias chad nvim.chad
alias nvim.ks='NVIM_APPNAME="nvim.ks" nvim'
alias ks nvim.ks
alias nvim.ks0='NVIM_APPNAME="nvim.ks0" nvim'
alias ks0 nvim.ks0
alias nvim.lazy='NVIM_APPNAME="nvim.lazy" nvim'
alias lazy nvim.lazy
#
abbr v ks
abbr nv "nvim -u NORC"  # vanilla version (no config file, no plugins)
#
set -gx NVIM_APPNAME nvim.ks
set -gx EDITOR nvim
set -gx VIEWER $EDITOR
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR

alias one="cd $DROPBOX/python/webapps/OneRing; ./start.sh; cd -"
alias morg="cd $DROPBOX/python/webapps/movieorg_project && source .venv/bin/activate.fish && ./start_app.py && deactivate"

abbr ts "time sync"
if test -x /opt/zed.app/bin/zed
    alias zed='/opt/zed.app/bin/zed'
else
    alias zed='/usr/bin/zeditor'
end
alias maximize_window="$DROPBOX/python/hotkeys/maximize_window_without_toggle.py"
alias z.="zed .; maximize_window"
alias z="z."
alias e="z."     # e - edit
alias e.="z."     # e - edit
# alias c.="z."    # to force myself to use Zed instead of VS Code
alias zr="pkill zed && sleep 0.1 && z."  # zed restart
alias rz="zr"                            # restart zed
alias rstudio="/usr/lib/rstudio/rstudio"
alias ccdd="$DROPBOX/raylib/python/countdown/start.sh"
abbr fr fresh  # yay -S fresh-editor-bin, see https://github.com/sinelaw/fresh

abbr c. "code ."   # open current dir. in VS Code

abbr ge "setsid gedit >/dev/null 2>&1"

# Fortran
abbr gf gfortran
alias rr="$DROPBOX/python/Fortran_compile_run/ezf.py"   # https://github.com/jabbalaci/ezf
alias ezf=rr
alias ml="$DROPBOX/fortran/_jflib/tools/ml.py"          # multiline creator

# Zig
# abbr z zig
# abbr zr "zig run"
# abbr zt "zig test"
# abbr zb "zig build"
# abbr zbr "zig build run"
# abbr ze "zig build-exe"
# abbr zef "zig build-exe -O ReleaseFast"
# abbr zesf "zig build-exe -O ReleaseSafe"
# abbr zesm "zig build-exe -O ReleaseSmall"
# abbr zew "zig build-exe -target x86_64-windows"

# Nim
alias nim_all="micro -readonly on $DROPBOX/nim/_projects/00_list_functions/all.txt"
alias pi=$DROPBOX/nim/_projects/pi/pi
alias rod=$DROPBOX/nim/_projects/NimCliHelper/rodcli.nim
alias cache="du -skh $HOME/.cache/nimbang"
# set -gx PATH "$DROPBOX/nim/_projects/nimbang:$PATH"  # find development version first
abbr nimdoc "nim doc"
abbr nd "nim doc"
abbr nb nimbang
abbr nl nimble
abbr ncc "nim c --hints:off -o:a.out"                       # Nim C Compiler :)
abbr nr "nim r --hints:off --warnings:off"
abbr nimc "nim c"                                           # nim c
abbr nc "nim c"                                             # nim c (originally, nc is netcat)
abbr nimsilent "nim c --hints:off --warnings:off"           # silent compilation
abbr nimrel "nim c -d:release"                              # release build
abbr nimspeed "nim c --cc:clang -d:release --opt:speed"     # fast EXE
abbr nimfast  "nim c --cc:clang -d:release --opt:speed"     # fast EXE
abbr nimsmall "nim c -d:release --opt:size --passL:-s"      # small EXE
#
alias nimpkg="$DROPBOX/nim/_projects/nimpkg/nimpkg.py"
alias lastnim="$DROPBOX/nim/Nim-2026/last.nim"
abbr addnb addnimbang
abbr nbadd addnimbang
abbr inim "inim --showColor=false"

# Commodore 64 (C64)
abbr x64 x64sc
abbr xcb xcbasic3

# Flow Control text editor
alias flow /opt/flow/flow
abbr fl flow
