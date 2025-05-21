false && begin  # example
    % pwd
    /tmp

    % mdgo send

    % pwd
    /tmp/send
end

false && begin  # note
Makes the directory and enters into it. Others like to call it `mdcd`.
end


function mdgo --argument dir -d "Make directory and cd into it"
    if test -z $dir
        echo "Usage: mdgo <dir>" >&2
        return 1
    end

    mkdir -p $dir && cd $dir
end
