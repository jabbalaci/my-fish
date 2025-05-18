# $ yay -S qrencode

function qrcode2 -d "Generate a QR code from text [PNG] (filter)"
    read -l text
    set -l fname /tmp/qrcode.34rf4df.png

    qrencode "$text" -t PNG -o $fname -s 30 -m 1
    open $fname 2>/dev/null
end
