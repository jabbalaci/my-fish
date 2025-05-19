# https://github.com/razzius/fish-functions/blob/main/functions/take.fish
# Take the first n lines of standard input.
#
# $ seq 5 | take 3
# 1
# 2
# 3

function take --argument number -d "Take the first `<n>` lines of stdin (filter)"
    head -$number
end
