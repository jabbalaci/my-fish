function qj -d "QuickJump script"
    set -l QJ "$DROPBOX/python/quickjump/quickjump.py"
    if test -z $argv[1]
        $QJ
    else
        cd ($QJ $argv[1])
    end
end
