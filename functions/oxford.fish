false && begin  # example
    % oxford
    # find a word and open English dictionary
end


function oxford -d "Find a word and open Oxford Advanced Learner's Dictionary (PDF)"
    cd $DROPBOX/dictionary/scripts/final_script
    ./oxford.py
    cd -
end

# skip
