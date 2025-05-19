# https://github.com/razzius/fish-functions/blob/main/functions/row.fish
# Prints the row of input indicated.
#
# $ seq 3 | rown 2
# 2

function rown --argument index -d "Print the row of the input indicated (filter)"
    sed -n "$index p"
end
