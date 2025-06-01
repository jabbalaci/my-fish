false && begin  # example
    % cat file.txt
    aa      bb     cc
    dd

    % cat file.txt | words
    aa
    bb
    cc
    dd
end

false && begin  # note
Each word is printed on a separate line.
end


function words -d "Split input into words (filter)"
	collapse | string split " "
end
