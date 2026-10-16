false && begin  # example
    % print doc.pdf
    # creates output_raster.pdf that is printable
end

false && begin  # note
At my workplace, when I print a PDF, the printing sometimes fails.
The printer prints some pages and at a point it prints the following
text on a page:

ERROR:
typecheck
OFFENDING COMMAND:
known

Solution: convert the pages to images but keep the PDF format.
end

function print --argument fname -d "Make a problematic PDF file printable"
    if test -z "$fname"
        echo "Error: filename argument is required" >&2
        return 1
    end

    echo "Working. It may take some time..."
    pdftoppm -r 600 $fname page
    magick page-*.ppm output_raster.pdf
    okular output_raster.pdf &
end
