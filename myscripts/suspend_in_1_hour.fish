#!/usr/bin/env fish

# suspend my machine in an hour

echo "# waiting 1 hour and then suspending the machine"
sleep 3600 && systemctl suspend
