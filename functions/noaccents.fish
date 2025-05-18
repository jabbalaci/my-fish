function noaccents -d "Remove accents [á -> a, etc.] (filter)"
    python3 -c "
import sys

d = {
    'á': 'a',
    'é': 'e',
    'í': 'i',
    'ó': 'o',
    'ö': 'o',
    'ő': 'o',
    'ú': 'u',
    'ü': 'u',
    'ű': 'u',
    'Á': 'A',
    'É': 'E',
    'Í': 'I',
    'Ó': 'O',
    'Ö': 'O',
    'Ő': 'O',
    'Ú': 'U',
    'Ü': 'U',
    'Ű': 'U',
}

s = sys.stdin.read()
for k, v in d.items():
    s = s.replace(k, v)
print(s, end='')
"
end
