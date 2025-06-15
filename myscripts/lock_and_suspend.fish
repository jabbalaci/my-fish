#!/usr/bin/env fish

# suspend my machine
# when waking up, the screen is locked

slock &
sleep 0.5
systemctl suspend
