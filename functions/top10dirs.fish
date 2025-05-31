false && begin  # example
    % top10dirs
    367G    .
    107G    ./retroujsag
    91G     ./youtube
    39G     ./byte_magazine
    ...
end

false && begin  # note
List the top 10 directories in the current folder in descending order by size.
end


function top10dirs -d "Top 10 largest directories"
    # including hidden dirs too
	du -h --max-depth=1 2>/dev/null | sort -hr | head -n 10
end
