false && begin  # example
    % echo "largest prime below 1 million" | wolfram
    999983
    % echo "Is 31 a prime?" | wolfram
    yes
end

false && begin  # note
You need an API key for this \(it\'s free\).
API docs: https://products.wolframalpha.com/short-answers-api/documentation
end


function wolfram -d "Ask Wolfram Alpha (filter)"
    if test "$TERM_PROGRAM" = "WezTerm"
        set -l img $ASSETS/others/wolf.png
        wezterm imgcat $img --width 150px
    end
    #
    set -l appid $WOLFRAM_SHORT_ANSWERS_API_KEY
    read -l input
    set input (echo "$input" | quote)
    timeout 5s curl "https://api.wolframalpha.com/v1/result?appid=$appid&i=$input"
    echo
end
