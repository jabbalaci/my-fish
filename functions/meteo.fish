false && begin  # example
    % meteo paris,france
    Weather:
      Report: temperature: 24.22 C \(76 F\) conditions: clear sky
      Locale: Paris, France current time: 2025-05-30 22:49:15
        Source: OpenWeatherMap.org
end

false && begin  # note
The location\'s format is `city,country` . It\'s a string with no space in it.
In case of problems, consult OpenWeatherMap.org
end


function meteo --argument location -d "Weather report"
    set -l default "debrecen,hungary"
    if test -z "$location"
        set location $default
    end

    inxi -w $location
end
