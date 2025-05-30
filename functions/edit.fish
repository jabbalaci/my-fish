false && begin  # example
    % edit file.txt
    # opens file.txt with Microsoft edit
end

false && begin  # note
A simple editor for simple needs. See https://github.com/microsoft/edit for more info.
end


function edit -d "Start Microsoft edit"
	$DROPBOX/home/jabba/opt/edit $argv
end
