############
# bindings #
############

# Shared bindings:              https://fishshell.com/docs/current/interactive.html#shared-bindings
# Emacs mode commands:          https://fishshell.com/docs/current/interactive.html#emacs-mode-commands

# $ fish_key_reader
#   ^ it shows you what escape sequence a keypress produces

# bind alt-l 'commandline -i "ls -al"; commandline -f execute'    # **l**ist dir (working solution)
bind alt-g 'git status; commandline -f repaint'                 # **g**it status
# bind alt-m 'mc; commandline -f repaint'                         # **m**idnight commander
bind ctrl-space forward-char                                    # accept auto-completion
# commandline -a appends text to the current command
bind alt-p 'commandline -a " | less"'                           # alt-p now uses `|` instead of `&|` (p: paginate)
bind alt-c 'commandline -i "yay -Scc"'


# +++++++++++ #
# ++  old  ++ #
# +++++++++++ #
# alt-u: upcase-word                                # **u**percase word
# alt-c: capitalize word                            # **c**apitalize word
# bind alt-l downcase-word                          # **l**owercase word
# bind alt-l 'ls -al; commandline -f repaint'       # Not good! Explanation here: https://github.com/fish-shell/fish-shell/issues/11525
# bind ctrl-n forward-char                          # accept auto-completion (next)
