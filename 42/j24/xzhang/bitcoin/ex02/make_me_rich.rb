#!/usr/bin/env ruby

require 'json'



#if ARGV.size == 2
#	if ARGV[0] == "buy"
#		`curl --data "user_token=4wZ8qJNyayyUA9Nvedtx&btc_amount=#{ARGV[1]}&kind=buy" 91.121.146.64/exchange`
#	elsif ARGV[0] == "sell"
#		`curl --data "user_token=4wZ8qJNyayyUA9Nvedtx&btc_amount=#{ARGV[1]}&kind=sell" 91.121.146.64/exchange`
#	else
#		puts "Write buy or sell as first parameter"
#	end
#else
#	puts "Usage : ./make_me_rich.rb [buy/sell] amount"
#end








rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`

cote0 = JSON.parse(rslt)["current"].to_i

sleep(4)

rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`

cote1 = JSON.parse(rslt)["current"].to_i

sleep(4)

rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`

cote2 = JSON.parse(rslt)["current"].to_i

sleep(4)
rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`

cote3 = JSON.parse(rslt)["current"].to_i

sleep(4)



while true

	sleep(2)
	rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`
	cote4 = JSON.parse(rslt)["current"].to_i
	diff4 = JSON.parse(rslt)["diff"].to_i
	btc = JSON.parse(rslt)["money_btc"].to_i
	money = JSON.parse(rslt)["money_dollar"].to_i

	buyable = (money)/(cote4)
	buyable = buyable.to_s

	moyenne0 = (cote1 + cote2)*100/2

	moyenne1 = (cote2 + cote3)*100/2
	
	moyenne2 = (cote3 + cote4)*100/2

	variation0 = moyenne1 - moyenne0
	variation1 = moyenne2 - moyenne1

	moyenneGlobal = (moyenne0 + moyenne1 + moyenne2)/3

	moyenne_achat =0

	emergemcy = false

	if (diff4< -80)
		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{btc}&kind=sell" 91.121.146.64/exchange`
		rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`
		cote4 = JSON.parse(rslt)["current"].to_i
		diff4 = JSON.parse(rslt)["diff"].to_i
		btc = JSON.parse(rslt)["money_btc"].to_i
		money = JSON.parse(rslt)["money_dollar"].to_i

		buyable = (money)/(cote4)
		buyable = buyable.to_s

		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{buyable}&kind=buy" 91.121.146.64/exchange`

		emergency = !emergency
	elsif (diff4>80)
		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{btc}&kind=sell" 91.121.146.64/exchange`
		emergemcy = !emergency
	end



	if (variation0<=0) && (variation1>0) && (moyenne2< (moyenneGlobal+100)) && (emergemcy ==false)
		
		cote_achat = cote4

		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{buyable}&kind=buy" 91.121.146.64/exchange`

	elsif (variation0<=0) && (variation1>0) && (moyenne2<moyenneGlobal) &&(emergemcy ==false)
			sleep(3)
			rslt = `curl -s 91.121.146.64/value.json\?user_token={yRgKbVxvrFEfX9Q1EGc3}`
			diff = JSON.parse(rslt)["diff"].to_i
			if diff >0
				`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{buyable}&kind=buy" 91.121.146.64/exchange`
			end


	elsif (variation0>=0) && (variation1<0) && ((moyenneGlobal - moyenne2)>100) &&(emergemcy ==false)

		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{btc}&kind=sell" 91.121.146.64/exchange`

	elsif (variation0<0) && (variation1<0) &&(emergemcy ==false)
		`curl -s --data "user_token=yRgKbVxvrFEfX9Q1EGc3&btc_amount=#{btc}&kind=sell" 91.121.146.64/exchange`
	end

	cote0 = cote1
	cote1 = cote2
	cote2 = cote3
	cote3 = cote4

	puts "Moyenne actuel " + moyenne2.to_s
	puts "Moyenne global " + moyenneGlobal.to_s
	puts "Variation 0 " + variation0.to_s
	puts "Variation 1 " + variation1.to_s

end