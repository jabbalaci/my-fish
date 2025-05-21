false && begin  # example
    % function-descriptions
    * addprefix                     - Add prefix to every line \(filter\)
    * addsuffix                     - Add suffix to every line \(filter\)
    ...
end

false && begin  # note
List functions with their descriptions.

Here I wanted the list of "real" functions, without aliases.
In Fish, aliases are turned into functions behind the scenes. So I wanted to filter them out.

* A: function names \(with aliases\)
* B: aliases
* Print A\\B \(difference\)
end


function function-descriptions -d "Functions and their descriptions"
    set -l A /tmp/a.txt
    set -l B /tmp/b.txt

    functions | string split "," | grep -v "^fish" | grep -v "^fzf" | sort >$A
    alias | getcol 2 | sort >$B

    for line in (comm -23 $A $B)
        printf '* %-30s- %s\n' $line (functions -Dv $line)[-1]
    end
end
