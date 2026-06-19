false && begin  # example
    % printable bad.pdf
    # output_raster.pdf is created, which is printable
end

false && begin  # note
At my workplace, when I print a PDF, the printing sometimes fails.
The printer prints some pages and at a point it prints the following
text on a page:

ERROR:
typecheck
OFFENDING COMMAND:
known

Solution: convert the pages to images and group the images in a PDF file.
end

function printable --argument fname -d "Make a PDF file printable"
    if test -z "$fname"
        echo "Error: provide a PDF file as argument" >&2
        return 1
    end

    pdftoppm -r 600 "$fname" page
    magick page-*.ppm output_raster.pdf
end
