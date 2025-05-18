function justify -d "Fully justify text to <width> [default: 78] (filter)"
    set -l width 78
    if test -n "$argv[1]"
        set width $argv[1]
    end

    python3 -c "
import sys

width = int('$width')
text = sys.stdin.read()

def justify_paragraph(words, width):
    lines = []
    line = []
    line_len = 0

    for word in words:
        if line_len + len(word) + len(line) > width:
            lines.append(line)
            line = [word]
            line_len = len(word)
        else:
            line.append(word)
            line_len += len(word)
    if line:
        lines.append(line)

    result = []
    for i, line in enumerate(lines):
        if i == len(lines) - 1 or len(line) == 1:
            result.append(' '.join(line).ljust(width))
        else:
            total_spaces = width - sum(len(word) for word in line)
            gaps = len(line) - 1
            base_space = total_spaces // gaps
            extra_space = total_spaces % gaps
            justified = ''
            for j, word in enumerate(line[:-1]):
                justified += word
                justified += ' ' * (base_space + (1 if j < extra_space else 0))
            justified += line[-1]
            result.append(justified)
    return result

paragraphs = text.splitlines()
buffer = []
for line in paragraphs:
    if line.strip() == '':
        if buffer:
            words = ' '.join(buffer).split()
            for justified_line in justify_paragraph(words, width):
                print(justified_line)
            print()  # blank line between paragraphs
            buffer = []
    else:
        buffer.append(line)

# Final paragraph (if any)
if buffer:
    words = ' '.join(buffer).split()
    for justified_line in justify_paragraph(words, width):
        print(justified_line)
"
end
