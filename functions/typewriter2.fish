false && begin  # example
    % cat main.c | typewriter2
    #include <stdio.h>

    int main...
end

false && begin  # note
The content of the file is printed character by character,
with some delay. This version adds clicky sounds to
each character, making it similar to typing on a keyboard.

The sound files are played with `mplayer` \(make sure it\'s installed\).
You can download some sound file packs from here: https://github.com/jabbalaci/keysound/tree/main/sounds .
This one uses the `fallout` sound pack.
end


function typewriter2 -d "Print like a typewriter with sound effects (filter)"
    python3 -S -c "
import glob
import os
import random
import sys
import time

WAIT = 0.08   # how many seconds to wait between two characters
RANDOM = 0.3  # skip 30% of normal keysounds (to reduce the clicks a bit)

DIR = '/home/jabba/Dropbox/python/keysound/sounds/fallout'
keys = glob.glob(f'{DIR}/key*.wav')
space = glob.glob(f'{DIR}/space.wav')[0]
enter = glob.glob(f'{DIR}/enter.wav')[0]

def play_sound(c):
    if c == '\n':
        fname = enter
    elif c == ' ':
        fname = space
    else:
        fname = random.choice(keys)
    #
    cmd = f'mplayer \'{fname}\' 1>/dev/null 2>/dev/null &'
    os.system(cmd)

for c in sys.stdin.read():
    if c in (' ', '\n'):
        play_sound(c)
    else:
        if random.random() > RANDOM:
            play_sound(c)
    sys.stdout.write(c)
    sys.stdout.flush()
    try:
        time.sleep(WAIT)
    except KeyboardInterrupt:
        print()
        break
"
end
