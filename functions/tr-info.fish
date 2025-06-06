false && begin  # example
    % tr-info
    # print some info about its basic usage
end


function tr-info -d "Basic usage of the tr command"
	echo -n "\
tr
==
    replace a character to another

Examples:
---------
    cat /etc/passwd | tr : '#'
    cat /etc/passwd | tr : '|'

    cat file.txt | tr '[a-z]' '[A-Z]'

    cat file.txt | tr -d ' '
"
end
