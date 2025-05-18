function typewriter -d "Print like a typewriter (filter)"
    python3 -c "
import sys
import time

for c in sys.stdin.read():
    sys.stdout.write(c)
    sys.stdout.flush()
    try:
        time.sleep(0.1)
    except KeyboardInterrupt:
        print()
        break
"
end
