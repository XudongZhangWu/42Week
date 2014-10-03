#! /usr/bin/env ruby

if ARGV.size==1
    
    bool = false

    int=0
    ARGV[0].each_char do |x|
        
        if x =="z"
            int +=1
            bool = true
        end
    end
    string=""
    
    int.times do
        string = string +"z"
    end

    if bool == true
    puts string

    elsif puts "none"
    end

else puts "none"
    
end