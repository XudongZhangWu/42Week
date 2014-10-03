#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'
require 'uri'

if ARGV.size <2
    puts "no enough arguments"
    
    else
    
    int =0
    

    def valid_url?(url)
  Nokogiri::HTML open(url)
  true
rescue
  false
end
    
    
    while int < ARGV.size-1
        
        
        if ARGV[int] == "--link"
            puts "===================================="
            
            string = ARGV[ARGV.size-1]
            
            content = (Nokogiri::HTML open(string)).to_s
            
          
          indice = 0
          valides = []
          
           urls = URI.extract(content, ['http', 'https'])
            
            
            urls.each do |link|
                
                if valid_url? link
                    indice +=1
                    valides << link
                end
              end

            puts valides.size.to_s + " liens sur la page :"

            valides.each do |link|
                puts link
            end



   
   
        else
        
        begin
            
            puts "===================================="
            
            string = ARGV[ARGV.size-1]
            
            contents = (Nokogiri::HTML open(string)).to_s
            
            puts ARGV[int] + ": " + contents.scan(ARGV[int]).size.to_s + " fois"
            
            rescue
            puts "Couldn't read " +"\"" + string +"\""
            
            
        end
        
        end
        
        int +=1
    end
    
    
    
end