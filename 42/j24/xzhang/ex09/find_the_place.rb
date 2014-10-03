#! /usr/bin/env ruby

compteur =0

if ARGV.size <3
	puts "none"
else
	address = ""
	ARGV.each do |x|
		if (compteur%2)==0
			address = address + x
		end
		compteur +=1
	end
puts address
end