#!/usr/bin/env ruby

require 'oauth'
require 'json'
require 'net/http'

def put_usage
	puts "Usage : ./twit_it.rb --option keyword"
	puts "Options = [--get, --post, --search]"

end

def put_timeline tweets
	i = 1
	tweets.each do |tweet|
		puts "#{i}: " + tweet["text"]
		i += 1
	end
end



#####################################################
# Remplissez les differents champs avec les tokens que vous
# avez generes dans les exercices precedents
#####################################################

consumer_key = OAuth::Consumer.new(
  "Qm1OMdLfPslGoEfcoqJ7A8N2q",
  "cG0GrObrPWGTI1uw8FShQi1OKrSwiyntqyBips95Skqa7XTlCm")
access_token = OAuth::Token.new(
  "2797599219-7bWRhqAfh4wACoYOBT0Y32E04cammYhc7G8U4SW",
  "8VYWiFCsEmwbf27kVy12GHUqGXerGiGiq9u9tUTRqDEm4")

baseurl = "https://api.twitter.com"

#####################################################
# A faire : Chercher comment formuler une requete qui vous permettra de
# chercher, poster, afficher vos tweets et ceux des autres.
# Doc : - https://dev.twitter.com/rest/public/search
# 		- http://ruby-doc.org/stdlib-2.1.3/libdoc/net/http/rdoc/Net/HTTP.html
# mais surtout, google !
#####################################################



if ARGV.size != 2
	put_usage

else

case ARGV[0]
when "--tweet"
	path    = "/1.1/statuses/update.json"
	address = URI("#{baseurl}#{path}")

when "--get"
	path = "/1.1/statuses/user_timeline.json"
	address = URI("#{baseurl}#{path}")



	http             = Net::HTTP.new address.host, address.port
	http.use_ssl     = true
	http.verify_mode = OpenSSL::SSL::VERIFY_PEER

	query = URI.encode_www_form("screen_name" => ARGV[1], "count" => 10)
	address += "?#{query}"
	request = Net::HTTP::Get.new address.request_uri
	request.oauth! http, consumer_key, access_token
	http.start
	response = http.request request
	tweets = nil
	if response.code == "200"
		tweets = JSON.parse(response.body)
		put_timeline tweets
	else
		puts "Could not fetch the timeline! " + "Code: #{response.code} Body:#{response.body}"
	end

when "--search"
	path = "/1.1/statuses/search/tweets.json"
	address = URI("#{baseurl}#{path}")



else
	put_usage
end



end
