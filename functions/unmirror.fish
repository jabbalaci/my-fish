false && begin  # example
    % echo "llɘʜƨ ʜƨiᖷ" | unmirror
    Fish shell

    % echo "llɘʜƨ ʜƨiᖷ" | unmirror | mirror
    llɘʜƨ ʜƨiᖷ
end

false && begin  # note
It might be improved with https://www.flipyourtext.com/
end


function unmirror -d "Convert mirrored text back to normal (filter)"
    python3 -S -c "
import sys

s1 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<([>)]{}3'
s2 = 'ɒdɔbɘʇϱʜiįʞlmnoqpяƨɈυvwxჸzAꓭƆꓷƎᖷӘHIႱꓘ⅃MИOᕋϘЯƧTUVWXYZ>)]<([}{Ɛ'

s1 += '/'
s2 += '\\\\'
s1 += '\\\\'
s2 += '/'

s1, s2 = s2, s1

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
