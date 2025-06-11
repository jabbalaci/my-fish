false && begin  # note
I use Manjaro with XFCE and I assigned it to Super+s the following way:

Open Settings → Keyboard → Application Shortcuts, then add this command:

`fish -c 'workspace'`

Advantage: it works globally. Unfortunately, the terminal didn\'t recognize the Super key.
end


function workspace -d "Identify the current workspace"
	notify-send -t 500 "Workspace $(math $(xdotool get_desktop) + 1)"
end
