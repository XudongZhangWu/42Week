#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

n = ARGV.size

if n == 0
	puts "Usage : ./http_parser.rb keyword [keyword] url"
else
	begin
		page = Nokogiri::HTML(open(ARGV[n-1]))
		content = page.css('html').text
		for i in 0..n-2
			if content.scan(ARGV[i]).size > 0
				puts ARGV[i] + ": " + content.scan(ARGV[i]).size.to_s + " fois"
			end
		end
	rescue
		puts "Couldn't read " + "\"" + ARGV[n-1] + "\""
	end
end
