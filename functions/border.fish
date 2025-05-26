false && begin  # example
    % echo "Section 1" | border
    #################
    ##  Section 1  ##
    #################

    % echo "Section 1" | border '+'
    +++++++++++++++++
    ++  Section 1  ++
    +++++++++++++++++
end

function border --argument symbol -d "Draw border around text (filter)"
    read -l text
    set -l ch '#'
    if test -n "$symbol"
        set ch $symbol
    end

    python3 -S -c "
import sys

text = '$text'
c = '$ch'
if len(c) != 1:
    print('Error: symbol argument must be a single character')
    sys.exit(1)
# else
above = 4 + len(text) + 4
print(c * above)
print(f'{c*2}  {text}  {c*2}')
print(c * above)
"
end
