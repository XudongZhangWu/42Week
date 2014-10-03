#! /usr/bin/env ruby

def rot (value)
	return value.tr("a-zA-Z", "b-zaB-ZA")
end

if ARGV.size == 1
	puts rot(ARGV[0])
else
	puts "none"
end