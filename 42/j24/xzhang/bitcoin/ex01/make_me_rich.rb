#! /usr/bin/env ruby

require 'json'

user_token = "yRgKbVxvrFEfX9Q1EGc3"


address = "http://91.121.146.64/value.json?user_token=#{user_token}"

response = `curl -s #{address}`

current = JSON.parse(response)["current"]
diff = JSON.parse(response)["diff"]
dollar = JSON.parse(response)["money_dollar"]
btc = JSON.parse(response)["money_btc"]


puts current
puts diff
puts dollar
puts btc


bool=false

operation = false

if ARGV.size ==2

	if ARGV[0] == "buy" && Integer(ARGV[1])




		`curl -s --data "user_token=#{user_token}&btc_amount=#{ARGV[1]}&kind=#{ARGV[0]}" 91.121.146.64/exchange`
		bool = true

		operaton = true

	elsif ARGV[0] == "sell" && Integer(ARGV[1])
		`curl -s --data "user_token=#{user_token}&btc_amount=#{ARGV[1]}&kind=#{ARGV[0]}" 91.121.146.64/exchange`
		bool = true
		operaton = true
	end		
end 



if bool == false
	puts "Usage : ./make_me_rich.rb [buy/sell] amount"
elsif operation == true
		response = `curl -s #{address}`
		puts JSON.parse(response)["money_dollar"] + " dollars"
		puts JSON.parse(response)["money_btc"] + " bitcoins"
	else 
		puts "Transaction failed"
end






