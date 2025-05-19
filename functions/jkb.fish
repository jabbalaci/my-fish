function jkb --argument vault -d "Start Jabba's Knowledge Base"
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
                return 1
        end
    end
end

# skip
