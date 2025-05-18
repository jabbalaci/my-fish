############
# bindings #
############

# Shared bindings:              https://fishshell.com/docs/current/interactive.html#shared-bindings
# Emacs mode commands:          https://fishshell.com/docs/current/interactive.html#emacs-mode-commands

# alt-u: upcase-word                                # **u**percase word
# alt-c: capitalize word                            # **c**apitalize word
bind alt-l downcase-word                            # **l**owercase word
bind alt-g 'git status; commandline -f repaint'     # **g**it status
# bind alt-m 'mc; commandline -f repaint'
bind ctrl-n forward-char                            # accept auto-completion (next)
bind ctrl-space forward-char                        # accept auto-completion
# commandline -a appends text to the current command
bind alt-p 'commandline -a " | less"'               # alt-p now uses `|` instead of `&|` (p: paginate)
bind alt-c 'commandline -a " -Scc"'                 # to be used with the `yay` command
