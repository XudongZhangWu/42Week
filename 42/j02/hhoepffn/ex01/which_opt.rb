#!/usr/bin/env ruby
i=0

if ARGV.size  == 0
	puts "none"

else
 		if ARGV.include? "--opt1"
 			puts "--opt1"
 			i+=1
 		end	
 		if ARGV.include? "--opt2"
 			puts "--opt2"
			i+=1 		
 		end
 		if ARGV.include? "--opt3"
 			puts "--opt3"
 			i+=1
 		end
 	
if i == 0
 		puts "none"
end

end