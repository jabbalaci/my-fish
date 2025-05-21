false && begin  # example
    % moodle-link
    Insert a clickable \(YouTube\) link without embedding the video | Moodle

    URL: https://www.youtube.com/watch?v=dQw4w9WgXcQ
    '<a style="color: rgb(57, 155, 226);" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ#" target="_blank">https://www.youtube.com/watch?v=dQw4w9WgXcQ</a>'
    # copied to the clipboard
end

false && begin  # note
An interactive script that reads a URL and produces a string
that can be pasted in the source code of a Moodle page.
It inserts a clickable link and prevents embedding.
end


function moodle-link -d "Put a link on the given URL without embedding it | Moodle"
    echo "Insert a clickable (YouTube) link without embedding the video | Moodle"
    echo
    set -l url (read -P "URL: ")
    if test -z "$url"
        echo "Error: the URL cannot be empty" >&2
        return 1
    end

    # echo "<a style=\"color: rgb(250, 104, 0); background-color: rgb(255, 255, 255);\" href=\"$url\" target=\"_blank\" rel=\"noopener\">$url</a>"
    set -l text "<a style=\"color: rgb(57, 155, 226);\" href=\"$url#\" target=\"_blank\">$url</a>"
    echo $text
    echo -n $text | xsel -b
    echo "# copied to the clipboard"
end
