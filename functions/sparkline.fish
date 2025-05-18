# $ echo "15 8 23 17 42 8 35 27" | sparkline
# ▂▁▅▃█▁▇▆

function sparkline -d "Generate sparkline chart from numbers (filter)"
    python3 -c "
import re
import sys

# Unicode block characters for the sparkline
bars = ' ▁▂▃▄▅▆▇█'

def generate_sparkline(numbers):
    if not numbers:
        return ''

    # Find min and max for scaling
    min_val = min(numbers)
    max_val = max(numbers)

    # Handle flat line case
    if min_val == max_val:
        return bars[4] * len(numbers)  # Use middle character

    # Generate sparkline
    result = ''
    for num in numbers:
        # Scale to 0-8 range (0 being empty space, 8 being full block)
        if max_val == min_val:
            idx = 4  # Middle character if all values are the same
        else:
            idx = int(((num - min_val) / (max_val - min_val)) * 8)
        result += bars[idx]

    return result

# Process input line by line
for line in sys.stdin:
    numbers = []
    for s in line.split():
        try:
            numbers.append(float(s))
        except ValueError:
            pass

    if numbers:
        print(generate_sparkline(numbers))
    else:
        print('')
"
end
