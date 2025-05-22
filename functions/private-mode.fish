false && begin  # example
    % private-mode
    # start a private session
end

false && begin  # note
In private mode history will not be persisted.
end


function private-mode -d "Start private mode, history will not be persisted"
    echo "*** starting private mode ***"
    fish -P
    echo "*** end of private mode ***"
end
