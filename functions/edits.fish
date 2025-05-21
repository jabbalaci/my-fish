false && begin  # example
    % edits
    # prints some help about the editing possibilities
end

false && begin  # note
It just prints a text that sums up my aliases / functions
used for editing. How to edit `config.sh`, aliases, etc.
end


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
qj fs          - quick jump to ~/.config/fish/_scripts
edit2 <A> <B>  - edit two files side by side
"
end
