false && begin  # example
    % exit_code 3
    % echo $status
    3
end

false && begin  # note
Produce the given exit code. For testing purposes.
end


function exit_code --argument code -d "Produce the given exit code"
	return $code
end
