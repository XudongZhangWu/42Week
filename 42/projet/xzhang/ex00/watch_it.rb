#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

if ARGV.size ==0
	puts "Usage : ./watch_it.rb \"movie_name 1\" \"movie_name 2\" [...]"

else 
	ARGV.each do |movie|


		movie2 = movie[0].upcase + movie[1..movie.size-1]

		

		puts "Searching: " + movie
		puts "=============================="
		lien = "http://kickass.to/usearch/" + URI.escape(movie)

		page = (Nokogiri::HTML open(lien))


		urls = page.css('td div a[href]')

		
		urls.each do |x|
			bool = false
			if x.text.include? movie
				bool = true
			elsif x.text.include? movie2
				bool = true
			end	

			if bool == true

				puts  x.text
				break
			end
		end
	end 
end

