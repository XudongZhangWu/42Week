#! /usr/bin/env ruby

if ARGV.size ==1
	compteur =0
	mot = ""
	ARGV[0].each_char do |x|
		
		if (compteur%2)==0
			mot = mot +x
			
		end
		compteur +=1
	end
puts mot

else
	puts "none"
end