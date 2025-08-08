false && begin  # note
Start cudatext \(text editor\) in the background.

Under Manjaro, it\'s in the package `cudatext-qt5-bin`.
end


function ct -d "Start CudaText"
	cudatext $argv 2>/dev/null &
end
