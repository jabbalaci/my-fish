function edits -d "Print editing possibilities"
	echo -n "\
ec             - edit config.fish
ee             - edit environment variables
ea             - edit aliases
eb             - edit bindings
ep             - edit prompt
ef <name>      - edit the given function
epair <name>   - edit the given function and its pair (ex.: hex and unhex)

qj fish        - quick jump to ~/.config/fish
qj ff          - quick jump to ~/.config/fish/functions
edit2 <A> <B>  - edit two files side by side
"
end
