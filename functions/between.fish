function between -d "Print lines between `<start_line>` and `<end_line>` [incl.] (filter)"
    if test (count $argv) -lt 2
        echo "Usage: between <start_line> <end_line>" >&2
        return 1
    end

    set -l start_line $argv[1]
    set -l end_line $argv[2]

    python3 -c "
import sys

start_line = int('$start_line')
end_line = int('$end_line')

# Validate line numbers
if start_line < 1 or end_line < start_line:
    sys.stderr.write(f'Error: Invalid line range {start_line}-{end_line}\\n')
    sys.exit(1)

# Read all lines and print the specified range
for i, line in enumerate(sys.stdin, 1):
    if start_line <= i <= end_line:
        sys.stdout.write(line)
    elif i > end_line:
        # Exit early once we've passed the end line
        break
"
end
