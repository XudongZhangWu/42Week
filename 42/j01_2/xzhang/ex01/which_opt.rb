#! /usr/bin/env ruby


if ARGV.size <1
    puts "none"
    
else
    bool = false
    ARGV.each do |x|
        
        if x.include? "--opt1"
            puts "--opt1"
            bool = true
        elsif x.include? "--opt2"
            puts "--opt2"
            bool = true
        elsif x.include? "--opt3"
            puts "--opt3"
            bool = true
        end
    end
   if bool == false
       puts "none"
       end
    
    
end