false && begin  # example
    % pyloc
     143 ./lib.py
      24 ./02-functions_to_md.py
     104 ./01-filters_to_md.py
     271 total
end

false && begin  # note
Traverses the current directory recursively \(excluding .venv\),
and counts Python lines of code.
end


function pyloc -d "Count Python lines of code (excluding .venv)"
    find . -name "*.py" | grep -v ".venv" | xargs wc -l
end
