false && begin  # example
    % echo "https://fishshell.com/" | qrcode2
end

false && begin  # note
It requires the `qrencode` package \(`yay -S qrencode`\).
The QR code is saved as a PNG and opened automatically with the default image viewer
\(see [screenshot]\(https://i.imgur.com/DrFVW2i.png\)\).
end


function qrcode2 -d "Generate a QR code from text [PNG] (filter)"
    read -l text
    set -l fname /tmp/qrcode.34rf4df.png

    qrencode "$text" -t PNG -o $fname -s 30 -m 1
    open $fname 2>/dev/null
end
