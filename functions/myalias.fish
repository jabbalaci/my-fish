false && begin  # example
    % myalias rm
    alias rm 'rm -i'

    % myalias
    # list of all my aliases
end

false && begin  # note
`myalias` works similarly to `alias` in Bash/ZSH.
end


function myalias --argument arg -d "Similar to the alias in bash"
    if test (count $argv) -gt 1
        echo "Error: provide just one argument" >&2
        return 1
    end

	if test -z "$arg"
	    alias
    else
        alias | grep $arg
        abbr | grep $arg
    end
end
