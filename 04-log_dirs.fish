# Step 1: Log directory changes on every prompt.
# Use the fish_prompt event to save the current directory to a history file.

# Ensure the directory for the log file exists.
set pwd_log_dir "$HOME/.local/share/pwdlog"
set -g PWD_LOG_FILE "$pwd_log_dir/pwdlog.txt"

mkdir -p $pwd_log_dir

function log_directory_history --on-variable PWD
    # Append the current directory to the log file.
    pwd >> $PWD_LOG_FILE
end
