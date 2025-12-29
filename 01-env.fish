#############################
## Environmental variables ##
#############################

set -gx FISH_DIR "$HOME/.config/fish"
set -gx FISH_FUNCTIONS_DIR "$FISH_DIR/functions"
set -gx FISH_MYSCRIPTS_DIR "$FISH_DIR/myscripts"
# set -gx EDITOR "micro"
set -gx EDITOR "nvim"
set -gx VIEWER $EDITOR
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR
set -gx PAGER less
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx QT_SELECT "qt5"
set -gx DROPBOX "$HOME/Dropbox"
set -gx ASSETS "$DROPBOX/assets"

# include my API keys
source $DROPBOX/secret/own_api_keys.sh

# create the file ~/LIGHT_BACKGROUND (can be empty) to have a light theme
if test -f "$HOME/LIGHT_BACKGROUND"
    set -gx LIGHT_BACKGROUND 1
end

if test "$LIGHT_BACKGROUND" = "1"
    set -gx BAT_THEME "GitHub"
end

# The .NET tools collect usage data in order to help us improve your experience.
# Switch it off:
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

set -gx PYTHONSTARTUP "$HOME/.pystartup"

set -gx BROWSER "/usr/bin/microsoft-edge-stable"

# for ls and lf
# set -gx LS_COLORS "$(vivid generate alabaster_dark)"

# uv should use Python 3.13 by default
set -gx UV_PYTHON "3.13"

# Go lang.
set -gx GOPATH "$HOME/go"
set -gx PATH "$PATH:$HOME/go/bin"

# Nim lang.
set -gx PATH "$PATH:$HOME/.nimble/bin"          # Nim compiler, nimble package manager, it should come **first**
set -gx PATH "$PATH:$HOME/nimbledeps/bin"       # binaries installed with nimble (nim's package manager), it should come second

# for Valgrind if it drops an error
# https://bbs.archlinux.org/viewtopic.php?id=276422
# set -gx DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

# Python virt. env.
# Don't show the active virt. env. -> I'll manage it manually in my prompt
# set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# my own D binaries
set -gx PATH "$PATH:$DROPBOX/d_lang/_bin"

# ifx (Intel's Fortran compiler)
set -gx PATH "$PATH:/opt/intel/oneapi/2025.3/bin"
