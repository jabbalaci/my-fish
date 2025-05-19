# Function names only, without aliases.
# A: function names (with aliases)
# B: aliases
# Print A\B (difference).

function function-descriptions -d "Functions and their descriptions"
    set -l A /tmp/a.txt
    set -l B /tmp/b.txt

    functions | string split "," | grep -v "^fish" | grep -v "^fzf" | sort >$A
    alias | coln 2 | sort >$B

    for line in (comm -23 $A $B)
        printf '* %-30s- %s\n' $line (functions -Dv $line)[-1]
    end
end
