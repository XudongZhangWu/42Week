#! /usr/bin/env ruby

bool = false
ARGV.each do |x|

if x.downcase.include? "president"
	bool = true
end

if x.downcase.include? "attentat"
	bool = true
end

if x.downcase.include? "bauer"
	bool = true
end
end 
if bool
	puts "Alert !"
end