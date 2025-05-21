false && begin  # example
    % crepl
    C REPL v0.0.2 by Jabba Laci \(jabba.laci@gmail.com\), 2025
    \>\>\>
end

false && begin  # note
It starts my interactive C REPL. The project can be found here: https://github.com/jabbalaci/c-repl
end


function crepl -d "Start the C REPL"
    cd $DROPBOX/python/crepl
    ./start.sh
end
