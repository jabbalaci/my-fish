# Interactive/login shells {{{
if status is-login
    source "$HOME/.config/fish/01-env.fish"
end

if status is-interactive
    # set fish_greeting ""                    # no greeting
    set fish_color_valid_path               # disable underlines
    set fish_pager_color_prefix             # disable underlines when using TAB completions

    source "$HOME/.config/fish/02-aliases.fish"
    source "$HOME/.config/fish/03-bindings.fish"

    set -l DOS_PROMPT 0

    if test "$DOS_PROMPT" = "1"
        dos-greeting
        dos-prompt
    end
end
# }}}
