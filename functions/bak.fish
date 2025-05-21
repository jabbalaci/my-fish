# https://github.com/razzius/fish-functions/blob/main/functions/backup.fish

false && begin  # example
    % ls
    file.txt

    % bak file.txt

    % ls
    file.txt
    file.txt.bak
end

false && begin  # note
Makes a copy of a file with `.bak` extension.
end


function bak --argument filename -d "Create a backup file"
    if test -z "$filename"
        echo "Error: filename argument is required" >&2
        return 1
    end

    cp $filename $filename.bak
    chmod 644 $filename.bak
end
