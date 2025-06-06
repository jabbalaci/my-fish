function cut-info -d "Basic usage of the cut command"
	echo -n "\
Note: if the delimiters are whitespaces, use awk.

cut
===
    cut field(s)

    -d<delimiter>       delimiter between fields
    -f<range>           which field(s) to cut
                            -f1         1st column
                            -f1-3       1st, 2nd and 3rd columns
                            -f1,7       1st and 7nd columns
                            -f3-        all columns from the 3rd

Examples:
---------
\$ cat /etc/passwd | cut -d: -f1-3

\$ cat /etc/passwd | head -2
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin

\$ cat /etc/passwd | head -2 | cut -d: -f1
root
daemon
"
end
