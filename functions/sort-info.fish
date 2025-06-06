false && begin  # example
    % sort-info
    # print some info about its basic usage
end


function sort-info -d "Basic usage of the sort command"
	echo -n "\
sort
====
    -r          reverse (descending order)
    -n          treat values as numbers
    -k<field>   sort by the value of the field
    -t<char>    specify the delimiter between fields

Examples:
---------
    sort /etc/passwd
    sort -r /etc/passwd
    sort -k3 -t: /etc/passwd        (sort UIDs as strings)
    sort -k3 -t: -n /etc/passwd     (sort UIDs as numbers)
"
end
