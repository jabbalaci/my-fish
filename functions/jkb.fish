false && begin  # example
    % jkb
    # it starts JKB
end

false && begin  # note
JKB manages my knowledge base \(Jabba\'s Knowledge Base\).
This program is not \(yet\) open-sourced.
end


function jkb --argument vault -d "Start Jabba's Knowledge Base"
    set -l bak $(pwd)
    cd $DROPBOX/python/jkb
    if test -z $vault
        ./start.sh jkb
    else
        switch $vault
            case 'd' 'dlang'
                ./start.sh dlang
            case 'pascal'
                ./start.sh pascal
            case 'nim'
                ./start.sh nim
            case '*'
                echo "Unknown vault: $vault" >&2
                cd $bak
                return 1
        end
    end
    cd $bak
end

# skip
