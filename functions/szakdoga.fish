function szakdoga -d "Szakdolgozat letöltése"
	echo "\
~~~~~~~~~~~~~~~~~~~
~~  Fish verzió  ~~
~~~~~~~~~~~~~~~~~~~
A hallgatói dolgozatok (Informatikai Kar) itt érhetők el: https://dea.lib.unideb.hu
Egy szakdolgozat URL-je így néz ki (példa): https://dea.lib.unideb.hu/items/ed260496-92b4-428e-a8a5-5c9bd0c0f28f
"
    set -l url
    read -P "A letöltendő szakdolgozat URL-je: " url
    echo "# working..."
    set -l result (curl -s "$url" | ex.urls | grep bitstreams | grep download | head -1)
    echo $result
    echo -n $result | xsel -b
    echo "# copied to the clipboard"
    if test "$argv[1]" = "open"
	    open $result &>/dev/null
	end
end

# skip
