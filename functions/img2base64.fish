false && begin  # example
    % img2base64 img.png
    \<img src="data:image/png;base64,iVBORw0KGg...="\>
end

false && begin  # note
Useful if you want to embed an image in an HTML page.
end


function img2base64 -d "Convert image to HTML-embeddable base64 string"
    $DROPBOX/tanitas/szkriptek/embed_image_in_HTML_with_base64/embed_img.py $argv
end

# skip
