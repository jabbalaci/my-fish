# https://github.com/razzius/fish-functions/blob/main/functions/coln.fish
# Splits input on whitespace and prints the column indicated.
#
# $ echo 1 2 | coln 2
# 2

function coln -d "Split the input on whitespace and print the column indicated"
    awk '{print $'$argv[1]'}'
end
