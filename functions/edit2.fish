function edit2 -d "Edit two files side by side"
    if test (count $argv) -lt 2
        echo "Usage: edit2 <file1> <file2>" >&2
        return 1
    end

    set -l file_a $argv[1]
    set -l file_b $argv[2]

    micro -multiopen vsplit "$file_a" "$file_b"
end
