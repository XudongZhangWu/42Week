#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'
require 'optparse'
require 'colorize'
require 'httparty'

#VAR
i=0
bool=false

#FUNCTION
def put_usage
	puts "Usage : ./watch_it.rb \"movie_name 1\" \"movie_name 2\" [...]"
end

#MAIN
if ARGV.size > 0

	url = "http://kickass.to/usearch/"

	ARGV.each do |key|
 		url = url + "%22" + key.gsub(' ', '%20') + "%22%20"
	end
	

	url = url [0..-4] + "category%3Amovies/?field=seeders&sorder=desc"

	begin 
		page = Nokogiri::HTML open url
		title = page.css("a").select{|link| link['class'] == "cellMainLink"}
		
		str = "Searching: "
		ARGV.each do |key|
			 str = str + key + ", "
		end

		puts str [0..-3]
		puts "=============================="
		puts title[i].text.yellow
		puts "=============================="
		puts "Comment souhaitez vous visionner ce film ? [d(ownload)/s(treaming)/N(ext)/q(uit)]"

		opt = "zero"

		
		while bool == false
			opt = STDIN.gets.chomp()
			
			case opt
			
			when "d"
				download = page.css("a").select{|link| link['class'] == "idownload icon16"}
				dl = "\"#{download[i]["href"]}\""
				puts "Downloading and opening #{dl}"
				system("peerflix #{mag} -f ~")
			 	bool = true
			
			when "q"
				puts "q"
				bool = true
				exit
			
			when "s"
				magnet = page.css("a").select{|link| link['class'] == "imagnet icon16"}
				mag = "\"#{magnet[i]["href"]}\""
				system("peerflix #{mag} --vlc")
			 	bool = true

			when "N"
				i=i+1
				puts "=============================="
				puts title[i].text.yellow
				puts "=============================="
				puts "Comment souhaitez vous visionner ce film ? [d(ownload)/s(treaming)/N(ext)/q(uit)]"
			
			else 
				puts "Option non valide"
			end
		end
	rescue
		puts "Aucun resultat"
	end
else 
	puts put_usage
end