# you need an API key (it's free)
# https://products.wolframalpha.com/short-answers-api/documentation

function wolfram -d "Ask Wolfram Alpha (filter)"
    set img $ASSETS/others/wolf.png
    wezterm imgcat $img --width 150px
    #
    set -l appid $WOLFRAM_SHORT_ANSWERS_API_KEY
    read -l input
    set input (echo "$input" | quote)
    timeout 5s curl "https://api.wolframalpha.com/v1/result?appid=$appid&i=$input"
    echo
end
