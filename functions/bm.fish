false && begin  # example
    % pwd
    /tmp/send

    % bm -c file.txt
    Bookmarked: /tmp/send/file.txt

    % bm -l
    Bookmarked file: /tmp/send/file.txt

    % cd
    % pwd
    /home/jabba

    % bm -p
    '/tmp/send/file.txt' -> './file.txt'

    % bm -l
    Bookmarked file: /tmp/send/file.txt

    % bm -e
    Bookmark cleared.
end

false && begin  # note
```
Usage:
  bm -c \<file\>   : Bookmark file
  bm -p          : Paste bookmarked file here
  bm -l          : List bookmarked file
  bm -e          : Erase bookmark
```

You can mark \(bookmark\) a file. Then, move around
folders and paste the file in a destination folder.
It also works among sessions.
end


function bm -d "Bookmark a file (for copy/paste)"
    # Create universal variable if it doesn't exist
    set -qU JABBA_MARKED_FILE; or set -U JABBA_MARKED_FILE ""

    # Parse switches
    if contains -- -c $argv
        # -c requires a filename argument
        if set -q argv[2]
            set -l file $argv[2]
            if test -e "$file"
                set -U JABBA_MARKED_FILE (realpath "$file")
                echo "Bookmarked: $JABBA_MARKED_FILE"
            else
                echo "Error: File '$file' does not exist."
                return 1
            end
        else
            echo "Error: No file specified for -c option."
            echo "Usage: bm -c <file>"
            return 1
        end
    else if contains -- -p $argv
        # -p: Paste (copy) the file with overwrite protection
        if test -n "$JABBA_MARKED_FILE"
            set -l target_file (basename "$JABBA_MARKED_FILE")
            if test -e "./$target_file"
                echo "Error: File '$target_file' already exists."
                return 1
            else
                cp -v "$JABBA_MARKED_FILE" ./
            end
        else
            echo "Error: No file bookmarked. Use 'bm -c <file>' first."
            return 1
        end
    else if contains -- -l $argv
        # -l: List the bookmarked file
        if test -n "$JABBA_MARKED_FILE"
            echo "Bookmarked file: $JABBA_MARKED_FILE"
        else
            echo "No file bookmarked."
        end
    else if contains -- -e $argv
        # -e: Erase the bookmark
        set -eU JABBA_MARKED_FILE
        echo "Bookmark cleared."
    else
        # Help text
        echo "Usage:"
        echo "  bm -c <file>   : Bookmark file"
        echo "  bm -p          : Paste bookmarked file here"
        echo "  bm -l          : List bookmarked file"
        echo "  bm -e          : Erase bookmark"
    end
end
