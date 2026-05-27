false && begin  # example
    % cat main.nim
    echo "nim"

    % addnimbang main.nim
    % cat main.nim
    #!/usr/bin/env nimbang
    #off:nimbang-args c -d:release
    #nimbang-settings hideDebugInfo

    echo "nim"
end

false && begin  # note
My nimbang project is here: https://github.com/jabbalaci/nimbang
end

function addnimbang --argument fname -d "Add nimbang header to the file"
    if test -z "$fname"
        echo "Error: filename argument is required" >&2
        return 1
    end

    set -l header "#!/usr/bin/env nimbang
#off:nimbang-args c -d:release
#nimbang-settings hideDebugInfo
"
    set -l tmp_header (mktemp)
    echo $header >$tmp_header
    set -l tmp_source (mktemp)
    cat $tmp_header $fname >$tmp_source
    mv -f $tmp_source $fname
    chmod u+x $fname
end
