false && begin  # example
    % moodle-nolink
    Insert a URL as simple text, not as a hyperlink | Moodle

    URL: https://www.youtube.com/watch?v=2hPOfpI7j_Y
    '<span class="nolink">https://www.youtube.com/watch?v=2hPOfpI7j_Y</span>'
    # copied to the clipboard
end

false && begin  # note
It produces a string that can be pasted in the source code of a Moodle page.
The link \(URL\) will appear as a normal text, not as a hyperlink.
end


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
