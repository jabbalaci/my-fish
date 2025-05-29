false && begin  # example
    % find_conflicted_copies
    ./.git/index \(jabba-logic\'s conflicted copy 2025-05-27\)
    ...
end

false && begin  # note
The Dropbox client sometimes produces conflicted copies.
This function lists them.
end


function find_conflicted_copies -d "Find conflicted copies in your Dropbox folder"
	find . | grep -i "'s conflicted copy" | while read -l i; echo $i; end
end
