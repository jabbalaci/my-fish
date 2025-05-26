false && begin  # example
    % random-functions
    * unroman                       - Convert Roman numeral to number \(filter\)
    * sp                            - Show the current path or show the path of a given file
    * removesuffix                  - Remove suffix \(filter\)
end

false && begin  # note
It prints some random functions \(real functions and filters, but no aliases\).

Tip: call it from `fish_greeting`. It\'s easy to forget about your functions,
especially if you have many, so we need constant reminders.

How it works:

* A: function names \(with aliases\)
* B: aliases
* Print A\\B \(difference\)
end


function random-functions -d "Some random functions (so that you don't forget them)"
    set -l A (mktemp)
    set -l B (mktemp)

    functions | string split "," | grep -v "^fish" | grep -v "^fzf" | sort >$A
    alias | getcol 2 | sort >$B

    for line in (comm -23 $A $B | sort --random-sort | head -3)
        printf '* %-30s- %s\n' $line (functions -Dv $line)[-1]
    end

    command rm $A $B
end
