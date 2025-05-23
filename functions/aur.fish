false && begin  # example
    % aur edit
    # find the package 'edit' in the AUR repo
end

false && begin  # note
Find the given package in the AUR repository. It performs an "exact name" search.
end


function aur --argument pkg -d "Find package in the AUR repository"
    if test -z "$pkg"
        echo "Error: pkg argument is required" >&2
        return 1
    end

	set -l url "https://aur.archlinux.org/packages?O=0&SeB=N&K=$pkg&outdated=&SB=n&SO=a&PP=50&submit=Go"
	open $url &>/dev/null
end
