false && begin  # example
    % echo "Fish shell" | mirror
    llɘʜƨ ʜƨiᖷ

    % echo "Fish shell" | mirror | unmirror
    Fish shell
end

false && begin  # note
It might be improved with https://www.flipyourtext.com/
end


function mirror -d "Mirror text using mirrored Unicode characters (filter)"
    pypy3 -c "
import sys

s1 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<([>)]{}3'
s2 = 'ɒdɔbɘʇϱʜiįʞlmnoqpяƨɈυvwxჸzAꓭƆꓷƎᖷӘHIႱꓘ⅃MИOᕋϘЯƧTUVWXYZ>)]<([}{Ɛ'

s1 += '/'
s2 += '\\\\'
s1 += '\\\\'
s2 += '/'

def mirror_text(text):
    return ''.join(mirror_map.get(c, c) for c in text)[::-1]

for line in sys.stdin:
    for c in line.rstrip('\r\n')[::-1]:
        pos = s1.find(c)
        if pos > -1:
            sys.stdout.write(s2[pos])
        else:
            sys.stdout.write(c)
    print()
"
end
