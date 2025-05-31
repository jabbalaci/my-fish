false && begin  # example
    % top10files
    5,8G    ./install/ubuntu/ubuntu-24.04.1-desktop-amd64.iso
    5,6G    ./install/commodore_os_vision/CommodoreOS-20231213.iso
    ...
end

false && begin  # note
List the top 10 files in the current folder \(recursively\) in descending order by size.
end


function top10files -d "Top 10 largest files"
    find . -type f -print0 | du -h --files0-from=- | sort -hr | head -n 10
end
