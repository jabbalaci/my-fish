function gpu-info -d "GPU info"
    set -l cmd inxi -G
    echo "# $cmd"
    $cmd
end
