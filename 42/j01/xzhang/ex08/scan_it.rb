#! /usr/bin/env ruby

if ARGV.size == 2
    
    int = ARGV[0].size-1
    
    int2 =0
    
  
    int3 =0
    
    while int < ARGV[1].size
        

        if ARGV[1][int2..int] == ARGV[0]
            int3 +=1
        end
        
        int2 +=1
        int +=1
        

    end
    
    puts int3
    
    else puts "none"
    
end