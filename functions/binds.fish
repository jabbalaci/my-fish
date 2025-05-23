false && begin  # example
    % binds
    # list some useful keyboard bindings
end
false && begin  # note
Just a reminder for me. I tend to forget these goodies.
end


function binds -d "Some useful keyboard bindings in Fish"
	echo -n "\
alt-s                       -> previous command with sudo
alt + Left, alt + Right     -> go to prev. / next dir. in the history
alt-l                       -> ls -al (own)
alt-h                       -> man page of the command before the cursor
alt-w                       -> description of the command before the cursor
alt-e                       -> edit the current line in your text editor
ctrl-x                      -> copy the line to the clipboard
"
end
