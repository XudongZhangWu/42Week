#! /usr/bin/env ruby

if ARGV.size < 2
	puts "none"
else
	bool = true

	somme =0
	ARGV.each do |x|
		if x =~ /\A\d+\z/
			somme = somme + x.to_i
		else 
			bool = false
			break
		end
	end

	if bool
		puts "0"+ somme.to_s
	else 
		puts "not number"
	end
end