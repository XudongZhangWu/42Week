#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

if ARGV.size == 0 
	puts "Usage: --link keyword [keyword] URL"
else 
	if ARGV.include? "--link"
		#compter les link
		begin
			site = Nokogiri::HTML(open(ARGV.last))
			contentsite = site.text
		rescue
			puts "l'URL" + ARGV.last.to_s +  "n'existe pas"
			puts "Vous n'avez pas de connexions internet"
		end
		
		#on cherche tout les balises css avec <a> 
		links = site.css('a')

		#on construit un tableau avec tous les attributs html contenant href qui est un lien hypertexte
		hrefs = links.map {|link| link.attribute('href').to_s}
		
		puts "========================"
		puts hrefs.size.to_s + " liens sur la page :"
		hrefs.each do |lien|
		
		#on ne va afficher que les liens commencant par http 
		if lien.include? "http"
			puts lien
		end
		
		end
		
		puts "========================"
		#on compte maintenant le nombre d'occurence des mots cles
		
		keywords = ARGV[0...-1]

		keywords.each do |motcle|
		#on ne cherche pqs le --link dans le site
		if motcle == "--link"
		else
			a = contentsite.scan(motcle)
			puts motcle + ": " + a.size.to_s + " fois"
		end
		end
	else 
		puts "Ajouter --link pour pouvoir avoir le decompte des liens"
		begin
			site = Nokogiri::HTML(open(ARGV.last))
			contentsite = site.text
		rescue
			puts "l'URL" + ARGV.last.to_s +  "n'existe pas"
			puts "Vous n'avez pas de connexions internet"
		end
		keywords = ARGV[0...-1]

		puts "========================="
		keywords.each do |motcle|
			a = contentsite.scan(motcle)
			puts motcle + ": " + a.size.to_s + " fois"
		end
	end
end