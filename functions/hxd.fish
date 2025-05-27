false && begin  # note
HxD is an excellent hex editor. This is a Windows software,
available at https://mh-nexus.de/en/hxd/ . If you know a better
Linux alternative, let me know. We start it with wine.
end


function hxd -d "Start HxD"
    echo "# loading..."
	wine $DROPBOX/windows/utils/HxD/HxD64.exe $argv 2>/dev/null &
end
