false && begin  # example
    # copy text to clipboard
    % read_time
    Number of words on the clipboard: 664
    Required time: 4 mins 11 secs
end

false && begin  # note
Takes the text from the clipboard and tells you approximately
how much time is needed to read it.
end


function read_time -d "Estimate the read time of a text"
    $DROPBOX/python/reading_time/read_time.py
end

# skip
