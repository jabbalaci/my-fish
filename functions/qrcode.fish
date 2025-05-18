# $ yay -S qrencode

function qrcode -d "Generate a QR code from text [ANSI] (filter)"
    read -l text

    qrencode "$text" -t ANSI256 -m 2
end
