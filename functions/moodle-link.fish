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
