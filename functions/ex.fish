false && begin  # example
    % ex file.zip
    # extracts the archive
end

false && begin  # note
A universal solution for extracting any archive.
end


function ex --argument fname -d "Universal archive extractor"
    if test -z "$fname"
        echo "Error: fname argument is required" >&2
        return 1
    end

    if test -f $fname
        switch $fname
            case '*.tar.bz2'
                tar xvjf $fname
            case '*.tar.gz'
                tar xvzf $fname
            case '*.tar.xz'
                tar xvf $fname
            case '*.bz2'
                bunzip2 $fname
            case '*.rar'
                unrar x $fname
            case '*.gz'
                gunzip $fname
            case '*.tar'
                tar xvf $fname
            case '*.tbz2'
                tar xvjf $fname
            case '*.tgz'
                tar xvzf $fname
            case '*.zip'
                unzip $fname
            case '*.jar'
                unzip $fname
            case '*.Z'
                uncompress $fname
            case '*.7z'
                7z x $fname
            case '*'
                echo "'$fname' cannot be extracted via ex()" >&2
                return 1
        end
    else
        echo "'$fname' is not a valid file" >&2
        return 1
    end
end
