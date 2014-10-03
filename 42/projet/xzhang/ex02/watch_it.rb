#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'rubygems'

if ARGV.size == 0
    puts "Usage : ./watch_it.rb \"movie_name1\" \"movie_name2\" [...]"
else

    ARGV.each do |movie|
    
        puts "Searching : " + movie
        puts "===================="
        #print URI.escape(movie)
        
        begin
            
            basis = "http://kickass.to"
            page = Nokogiri::HTML(open("http://kickass.to/usearch/"+URI.escape(movie)+"/?field=seeders&sorder=desc"))
                
            site = basis + page.xpath('//div[@class="markeredBlock torType filmType"]/a').map { |link| link['href']}[0]
            firstLink = Nokogiri::HTML(open(site))
            
            title = firstLink.xpath("//title").text
            title.slice! "Download "
            title.slice! " Torrent - KickassTorrents"
            
            puts title
            
            magnet = page.xpath('//div[@class="iaconbox floatright"]/a').map { |link| link['href']}
            
            taille = magnet.size
            magnetFound = false

            lien_magnet = ""
            magnet.each do |mag|
                
              if mag.include? "magnet"
                puts "===================="
                lien_magnet = mag
                puts mag
                break
              end

            end  

            system("peerflix \"#{lien_magnet}\" --vlc")
        rescue
            puts "Cannot find the movie."
        end
        
    end
    
end