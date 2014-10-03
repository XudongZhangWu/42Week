#! /usr/bin/env ruby

if ARGV.size>0
    
    puts "parametres: " + ARGV.size.to_s
    
    ARGV.each do |x|
        
        int = 0
        x.each_char do |y|
           int +=1
        end
    
    puts x+": " + int.to_s
    end
   
else puts "none"
    
end