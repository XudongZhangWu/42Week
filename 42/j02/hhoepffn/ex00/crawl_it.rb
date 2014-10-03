#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

if ARGV == 0 
	puts "Usage : entrer d'abord tous les mots recherches puis lurl du site "
else
	begin
		site = Nokogiri::HTML(open(ARGV.last))
		contentsite = site.text
	rescue
		puts "l'URL n'existe pas"
		puts "Vous n'avez pas de connexions internet"
	end
			#tabelau des arguments sans le dernier
		keywords = ARGV[0...-1]

		keywords.each do |motcle|
			 a = contentsite.scan(motcle)
			puts motcle + ": " + a.size.to_s + " fois"
		end
end

