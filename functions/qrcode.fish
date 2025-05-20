false && begin  # example
    % echo "https://fishshell.com/" | qrcode
end

false && begin  # note
It requires the `qrencode` package \(`yay -S qrencode`\).
The QR code is shown in the terminal \(see [screenshot]\(https://i.imgur.com/WaWTdmG.png\)\).
end

function qrcode -d "Generate a QR code from text [ANSI] (filter)"
    read -l text

    qrencode "$text" -t ANSI256 -m 2
end
