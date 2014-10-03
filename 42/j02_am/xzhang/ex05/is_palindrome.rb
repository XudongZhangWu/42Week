#! /usr/bin/env ruby

def all_letters(str)
    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
    # yield true for the empty string
    str[/[a-zA-Z]+/]  == str
end

pal_test = false

if ARGV.size ==1
	if all_letters(ARGV[0])
		mot = ARGV[0].upcase
		if mot == mot.reverse
			pal_test = true
		end
	end

	if pal_test
		puts "OK"
	else 
		puts "KO"
	end
else 
	puts "none"
end