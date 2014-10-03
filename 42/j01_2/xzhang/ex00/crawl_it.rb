#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'


if ARGV.size <2
    puts "no enough arguments"
    
else

  int =0
  
  
  
  while int < ARGV.size-1
      begin
        
        string = ARGV[ARGV.size-1]
        
        contents = (Nokogiri::HTML open(string)).to_s
        
        puts ARGV[int] + ": " + contents.scan(ARGV[int]).size.to_s + " fois"
        
        rescue
        puts "Couldn't read " +"\"" + string +"\""


      end
      
      int +=1
  end
    
    
    
end