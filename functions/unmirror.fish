function unmirror -d "Convert mirrored text back to normal (filter)"
    python3 -c "
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
