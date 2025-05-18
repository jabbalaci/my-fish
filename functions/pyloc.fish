function pyloc -d "Count Python lines of code (excluding .venv)"
    find . -name "*.py" | grep -v ".venv" | xargs wc -l
end
