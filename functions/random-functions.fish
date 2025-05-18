# Function names only, without aliases.
# A: function names (with aliases)
# B: aliases
# Print A\B (difference).

function random-functions -d "Some random functions (so that you don't forget them)"
    set -l A /tmp/a.txt
    set -l B /tmp/b.txt

    functions | string split "," | grep -v "^fish" | grep -v "^fzf" | sort >$A
    alias | coln 2 | sort >$B

    for line in (comm -23 $A $B | sort --random-sort | head -3)
        printf '* %-30s- %s\n' $line (functions -Dv $line)[-1]
    end
end
