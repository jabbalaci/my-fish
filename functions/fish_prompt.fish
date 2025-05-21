false && begin  # note
This function provides the prompt before the cursor.
Edit it to create your own cool prompt.
end


function fish_prompt -d "Jabba's prompt"
    set -l last_status $status
    set -l normal (set_color normal)
    # set -l status_color (set_color brgreen)
    set -l time_color (set_color 999999)
    # set -l cwd_color (set_color $fish_color_cwd)
    set -l cwd_color (set_color -o purple)
    set -l green_color (set_color green)
    set -l cwd_color_bold (set_color -o $fish_color_cwd)
    set -l vcs_color (set_color black)
    set -l prompt_status ""

    set -l status_color (set_color -o black)
    # if not test -f $HOME/LIGHT_BACKGROUND
    if test "$TERM_PROGRAM" = "ghostty"
        set status_color (set_color -o white)  # for dark theme
    end

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    # set -l suffix '❯'
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    set -l short_dir (basename $PWD)/
    if test "$PWD" = "$HOME"
        set short_dir "~"
    end
    if test "$short_dir" = "//"
        set short_dir "/"
    end

    set -l branch_name (git symbolic-ref --short -q HEAD 2>/dev/null)
    or set branch_name ""

    if test -n "$branch_name"
        set branch_name " ($branch_name)"
    end

    set -l is_dirty false
    if test -n "$(git status --porcelain --ignore-submodules -unormal 2>/dev/null)"
        set is_dirty true
    end

    set -l git_color (set_color green)
    if $is_dirty
        set git_color (set_color -o red)
    end

    # set -l fish_logo "🐟"
    set -l fish_logo "🦈"

    set -l nim_project ""
    if count *.nimble >/dev/null 2>&1
        set nim_project " 👑"
    end

    echo -s $green_color '[' (date "+%H:%M:%S") '] ' $time_color "[$fish_logo$nim_project] " $normal $cwd_color (prompt_pwd) $normal $git_color $branch_name $normal ' ' $prompt_status
    # echo -n -s $time_color $short_dir ' ' $status_color $suffix ' ' $normal
    echo -n -s $status_color $suffix ' ' $normal
end
