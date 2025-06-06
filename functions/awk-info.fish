function awk-info -d "Basic usage of the awk command"
	echo -n "\
\$ date
Sun Mar 20 12:16:17 EDT 2011

\$ date | awk '{print \$2}'
Mar
"
end
