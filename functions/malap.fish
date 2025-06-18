false && begin  # example
    % malap c d py
    # `main.c` was created
    # `main.d` was created
    # `main.py` was created
end

false && begin  # note
`alap` \( https://github.com/jabbalaci/alap \) is a little CLI tool of mine for scaffolding files.
By default, it accepts just one argument, but with this function
I can call it with several ones.

\(The word "alap" means "base" or "basic" in Hungarian.\)
end


function malap -d "Multi alap, i.e. call my program `alap` with each argument"
	for arg in $argv
	    alap $arg
	end
end
