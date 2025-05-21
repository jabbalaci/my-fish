false && begin  # example
    % cat person.json
    {
        "last": "Doe",
        "first": "John",
        "daughter": {
            "last": "Doe",
            "first": "Jane"
        }
    }

    % json person.json
    root['last'] => 'Doe'
    root['first'] => 'John'
    root['daughter']['last'] => 'Doe'
    root['daughter']['first'] => 'Jane'
end

false && begin  # note
The project can be found here: https://github.com/jabbalaci/JSON-path
end


function json -d "Print key/value pairs in a JSON file"
    $DROPBOX/python/JSON-path/jsonpath.py $argv
end
