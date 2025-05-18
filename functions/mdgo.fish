function mdgo --argument dir -d "Make directory and cd into it"
    if test -z $dir
        echo "Usage: mdgo <dir>" >&2
        return 1
    end

    mkdir -p $dir && cd $dir
end
