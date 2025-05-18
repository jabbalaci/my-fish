function re -d "Wake up the Dropbox client"
    echo "# waking up the Dropbox client"
    cd ~/Dropbox
    set -l FILE tmp774545.txt
    touch ./$FILE
    sleep 15
    rm -f ./$FILE
end
