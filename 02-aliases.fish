#############################
# Aliases and abbreviations #
#############################

alias ec="$EDITOR $FISH_DIR/config.fish"                    # edit config (this) file
alias ee="$EDITOR $FISH_DIR/01-env.fish"                    # edit env.
alias ea="$EDITOR $FISH_DIR/02-aliases.fish"                # edit aliases
alias eb="$EDITOR $FISH_DIR/03-bindings.fish"               # edit bindings
alias ep="$EDITOR $FISH_DIR/functions/fish_prompt.fish"     # edit prompt
# ef                                                        # edit function (it exists as a function)
abbr config fish_config                                     # web-based configuration


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
alias ll='exa --icons --group-directories-first'
alias d="ls -al"
alias cls 'clear'
alias cdc 'cd; clear'
alias q="cls; d"
alias ... "cd ../.."
alias cd.. "cd .."
abbr - "cd -"
abbr p2 'python2'
abbr p3 'python3'
abbr p 'python3'
abbr pp 'python3clean'         # no extra info line
abbr f fish
abbr b bash
abbr z zsh
alias pypy='pypy3'
alias tree="tree -C"
alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vim $EDITOR
abbr v vim
abbr val valgrind
abbr m micro
abbr e edit
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
alias files "pacman -Ql"
abbr run 'chmod u+x'
abbr ff 'fastfetch'
alias nh='thunar . 2>/dev/null'    # nautilus here (replaced by thunar)
alias ssh='ssh -o ServerAliveInterval=60'
alias ppwd='/bin/pwd'
abbr c "code"
abbr c. "code ."   # open current dir. in VS Code
abbr jsh "jshell"
abbr ac "audacity"
abbr mongo "mongosh"
alias gedit="gedit 2>/dev/null"
# The convert command is deprecated in IMv7, use "magick" instead of "convert"
abbr convert "magick"
# Nim
abbr ncc "nim c -o:a.out"          # Nim C Compiler :)
alias nim_all="micro -readonly on /home/jabba/Dropbox/nim/_projects/00_list_functions/all.txt"
alias book="cd /home/jabba/Dropbox/books/assembly/current; ./open.sh"
alias sysinfo="inxi -Fxxxrz"

abbr pkg "pacman -Qo"       # The given file is in which package?
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
abbr fp flatpak
abbr rel "clear; exec fish"         # reload configuration changes in-place
alias dlang "jkb dlang"
alias nimm "jkb nim"
alias pas "jkb pascal"
abbr clip "xsel -b"
abbr cb "xsel -b"
abbr tocb "xsel -b"
abbr repo "gh repo view --web"          # yay -S github-cli
alias xxd "xxd -R never -g 1 -d"        # no color, group by 1 byte, show offset in decimal instead of hex [in package tinyxxd]
abbr mya myalias
abbr sx start_xmodmap
abbr puts echo
abbr mvv ren
abbr cpp cop
