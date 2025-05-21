false && begin  # example
    % gpu-info
    # inxi -G
    Graphics:
      Device-1: Intel CometLake-S GT2 [UHD Graphics 630] driver: i915 v: kernel
      Display: x11 server: X.Org v: 21.1.16 driver: X: loaded: modesetting
        dri: iris gpu: i915 resolution: N/A
      API: Vulkan v: 1.4.313 drivers: intel surfaces: N/A
      API: OpenGL Message: Unable to show GL data. glxinfo is missing.
      Info: Tools: api: vulkaninfo de: xfce4-display-settings
        x11: xdpyinfo, xprop, xrandr
end

false && begin  # note
Prints info about your GPU.
end


function gpu-info -d "GPU info"
    set -l cmd inxi -G
    echo "# $cmd"
    $cmd
end
