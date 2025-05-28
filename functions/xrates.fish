false && begin  # example
    % xrates
    1 EUR is 404.86 HUF
    1 USD is 355.87 HUF
end

false && begin  # note
See https://frankfurter.dev for more info. It\'s a free, open-source currency data API
that tracks reference exchange rates.
end


function xrates -d "Currency rates of HUF, EUR and USD"
    # set locale ONLY for this script
    set -l LC_NUMERIC "en_US.UTF-8"  # I want to see decimal points, not decimal commas.

	set -l api_call "https://api.frankfurter.app/latest?from=HUF&symbols=EUR,USD"
	set -l json (curl -s $api_call)
	# echo $json
	set -l eur (echo $json | jq ".rates.EUR")
	set -l usd (echo $json | jq ".rates.USD")
	set -l eur2huf (math 1 / $eur)
	set -l usd2huf (math 1 / $usd)
	printf '1 EUR is %.2f HUF\n' $eur2huf
	printf '1 USD is %.2f HUF\n' $usd2huf
end
