# https://github.com/razzius/fish-functions/blob/main/functions/skip-lines.fish
# Skips the first n lines of stdin.
#
# $ seq 5 | skip 2
# 3
# 4
# 5

function skip --argument n -d "Skip the first n lines of stdin"
    tail +(math 1 + $n)
end
