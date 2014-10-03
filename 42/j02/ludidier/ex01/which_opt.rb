#!/usr/bin/env ruby

i = 0

ARGV.each do |x|
	if x.include?("--opt1")
		puts "--opt1"
		i += 1
	end

	if x.include?("--opt2")
		puts "--opt2"
		i += 1
	end

	if x.include?("--opt3")
		puts "--opt3"
		i += 1
	end
end

if i == 0
	puts "none"
end
