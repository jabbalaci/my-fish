function moodle-nolink -d "Insert a URL as text, without putting a link on it | Moodle"
    echo "Insert a URL as simple text, not as a hyperlink | Moodle"
    echo
    set -l url (read -P "URL: ")
    if test -z "$url"
        echo "Error: the URL cannot be empty" >&2
        return 1
    end

    set -l text "<span class=\"nolink\">$url</span>"
    echo $text
    echo -n $text | xsel -b
    echo "# copied to the clipboard"
end
