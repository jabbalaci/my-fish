# https://github.com/razzius/fish-functions/blob/main/functions/backup.fish

function bak --argument filename -d "Create a backup file"
    if test -z "$filename"
        echo "Error: filename argument is required" >&2
        return 1
    end

    cp $filename $filename.bak
    chmod 644 $filename.bak
end
