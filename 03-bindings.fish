##############
## Bindings ##
##############

# Shared bindings:              https://fishshell.com/docs/current/interactive.html#shared-bindings
# Emacs mode commands:          https://fishshell.com/docs/current/interactive.html#emacs-mode-commands

# $ fish_key_reader
#   ^ it shows you what escape sequence a keypress produces

# bind alt-l 'commandline -i "ls -al"; commandline -f execute'      # **l**ist dir (working solution)
bind alt-g 'git status; commandline -f repaint'                     # **g**it status
bind alt-u 'gitup; commandline -f repaint'                          # calling my gitup function that uploads local changes
# bind alt-m 'mc; commandline -f repaint'                           # **m**idnight commander
bind ctrl-space forward-char                                        # accept auto-completion
# commandline -a appends text to the current command
bind alt-p 'commandline -a " | less"'                               # alt-p now uses `|` instead of `&|` (p: paginate)
bind alt-y 'commandline -i "yay -Scc"'                              # yay -Scc
bind alt-h 'echo && cdh; commandline -f repaint'                    # change to a recently visited directory
bind ctrl-o 'mc; commandline -f repaint'                            # start midnight commander
# bind alt-i 'ji; commandline -f repaint'                             # call zoxide's ji interactive selector
# bind alt-j 'ji; commandline -f repaint'                             # call zoxide's ji interactive selector
bind alt-l 'jl; commandline -f repaint'                             # *j*ump to previously (*l*ast) visited dir.

# +++++++++++ #
# ++  old  ++ #
# +++++++++++ #
# alt-u: upcase-word                                # **u**percase word
# alt-c: capitalize word                            # **c**apitalize word
# bind alt-l downcase-word                          # **l**owercase word
# bind alt-l 'ls -al; commandline -f repaint'       # Not good! Explanation here: https://github.com/fish-shell/fish-shell/issues/11525
# bind ctrl-n forward-char                          # accept auto-completion (next)
