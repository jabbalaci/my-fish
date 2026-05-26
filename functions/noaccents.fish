false && begin  # example
    % echo "László" | noaccents
    Laszlo
end


function noaccents -d "Remove accents [á -> a, etc.] (filter)"
    python3 -S -c "
import sys

d = {
    'á': 'a',
    'ä': 'a',
    'č': 'c',
    'é': 'e',
    'è': 'e',
    'ě': 'e',
    'í': 'i',
    'ó': 'o',
    'ö': 'o',
    'ő': 'o',
    'ú': 'u',
    'ů': 'u',
    'ü': 'u',
    'ű': 'u',
    'ý': 'y',
    'ž': 'z',
    'ł': 'l',
    'ń': 'n',
    'Á': 'A',
    'Å': 'A',
    'É': 'E',
    'Í': 'I',
    'Ó': 'O',
    'Ö': 'O',
    'Ő': 'O',
    'Ú': 'U',
    'Ü': 'U',
    'Ű': 'U',
    'Ř': 'R',
    'Š': 'S',
    'Ž': 'Z',
    '–': '-',
}

s = sys.stdin.read()
for k, v in d.items():
    s = s.replace(k, v)
print(s, end='')
"
end
